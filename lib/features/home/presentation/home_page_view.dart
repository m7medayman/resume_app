import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:resume_app/core/assets_path/assets.dart';
import 'package:resume_app/core/constants/app_sizes_constants.dart';
import 'package:resume_app/core/routing/routes_manager.dart';
import 'package:resume_app/core/theme_manager/color_manager.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheigth = MediaQuery.of(context).size.height;
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
            const DrawerItem(
              titile: "user",
              icon: Icons.person,
            ),
            const DrawerItem(titile: "logout", icon: Icons.logout)
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(
          "AI Resume Maker ",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Center(
        child: Container(
          width: screenWidth * 0.95,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisSpacing: 8.0, // Space between columns

                              childAspectRatio:
                                  0.4, // Aspect ratio of each item
                              crossAxisCount: 3),
                      itemCount: 30,
                      itemBuilder: (BuildContext context, int x) {
                        return Container(
                          width: screenWidth * 0.25,
                          height: screenheigth * 0.3,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                child: IconButton(
                                    onPressed: () {},
                                    icon: SvgPicture.asset(
                                      width: screenWidth * 0.25,
                                      height: screenheigth * 0.2,
                                      Assets.assetsResumeIcon,
                                    )),
                              ),
                              Container( 
                                  height: screenheigth * 0.1,
                                  child: const Text(
                                    "Flutter developre cv to looooooooooooooooooooooooooooong",
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
                      Navigator.of(context).pushNamed(Routes.resumeApplication);
                    },
                    child: Text(
                      "make Reume",
                      style: Theme.of(context).textTheme.bodyMedium,
                    )),
              )
            ],
          ),
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
