import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:resume_app/core/Di/injection.dart';
import 'package:resume_app/core/assets_path/assets.dart';
import 'package:resume_app/core/common/widgets/popup_pdf_info_dilog/popup_pdf_dialog.dart';
import 'package:resume_app/core/constants/app_sizes_constants.dart';
import 'package:resume_app/core/data_classes/pdf_view_data.dart';
import 'package:resume_app/core/routing/routes_manager.dart';
import 'package:resume_app/core/theme_manager/color_manager.dart';
import 'package:resume_app/features/home/domain/home_use_case.dart';
import 'package:resume_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:resume_app/features/home/presentation/cubit/home_page_special_states.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  late HomeCubit _homeCubit;
  @override
  void initState() {
    // TODO: implement initState
    _homeCubit = HomeCubit(
        getPdfUseCase: getIt<GetPdfUseCase>(),
        signOutUseCase: getIt<SignOutUseCase>());
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _homeCubit.close();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies

    _homeCubit.getPdf();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheigth = MediaQuery.of(context).size.height;
    return BlocProvider(
        create: (context) => _homeCubit,
        child: BlocListener<HomeCubit, HomeState>(listener: (context, state) {
          if (state.pageState is SignoutState) {
            Navigator.pushReplacementNamed(context, Routes.login);
          }
        }, child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return HomeScaffold(
              screenWidth: screenWidth,
              screenheigth: screenheigth,
              state: state,
            );
          },
        )));
  }
}

class HomeScaffold extends StatelessWidget {
  const HomeScaffold(
      {super.key,
      required this.screenWidth,
      required this.screenheigth,
      required this.state});

  final double screenWidth;
  final double screenheigth;
  final HomeState state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        width: screenWidth * 0.6,
        backgroundColor: ColorManager.backgroundColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: screenheigth * 0.1,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed(Routes.updateUserView);
              },
              child: const DrawerItem(
                titile: "update user info",
                icon: Icons.person,
              ),
            ),
            InkWell(
                onTap: () {
                  context.read<HomeCubit>().signOut();
                },
                child: const DrawerItem(titile: "logout", icon: Icons.logout))
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(
          "AI Resume Maker ",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: MainHomePage(
          state: state, screenWidth: screenWidth, screenheigth: screenheigth),
    );
  }
}

class MainHomePage extends StatelessWidget {
  const MainHomePage(
      {super.key,
      required this.screenWidth,
      required this.screenheigth,
      required this.state});
  final HomeState state;
  final double screenWidth;
  final double screenheigth;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: screenWidth * 0.95,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 8.0, // Space between columns

                            childAspectRatio: 0.4, // Aspect ratio of each item
                            crossAxisCount: 3),
                    itemCount: state.pdfWidgetData.length,
                    itemBuilder: (BuildContext context, int x) {
                      PdfWidgetViewData pdfData = state.pdfWidgetData[x];
                      return Container(
                        width: screenWidth * 0.25,
                        height: screenheigth * 0.3,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              child: IconButton(
                                  onPressed: () {
                                    PopupPdfDialog.showPdfDialog(
                                        context: context,
                                        pdfFilePath: pdfData.pdfLocation,
                                        screenHeight: screenheigth,
                                        screenWidth: screenWidth,
                                        pdfName: pdfData.pdfName);
                                  },
                                  icon: SvgPicture.asset(
                                    width: screenWidth * 0.25,
                                    height: screenheigth * 0.2,
                                    Assets.assetsResumeIcon,
                                  )),
                            ),
                            Container(
                                height: screenheigth * 0.1,
                                child: Text(
                                  state.pdfWidgetData[x].pdfName,
                                  overflow: TextOverflow.fade,
                                ))
                          ],
                        ),
                      );
                    })),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(Routes.resumeApplication)
                        .whenComplete(() {
                      context.read<HomeCubit>().getPdf();
                    });
                  },
                  child: Text(
                    "make Reume",
                    style: Theme.of(context).textTheme.bodyMedium,
                  )),
            )
          ],
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final String titile;
  final IconData icon;
  final bool isEnd;
  const DrawerItem({
    super.key,
    required this.titile,
    required this.icon,
    this.isEnd = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(),
        ListTile(
          title: Text(
            titile,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: ColorManager.textColor),
          ),
          leading: Icon(
            size: AppSize.drawerIcon,
            icon,
            color: ColorManager.textColor,
          ),
        ),
        Visibility(visible: isEnd, child: const Divider())
      ],
    );
  }
}
