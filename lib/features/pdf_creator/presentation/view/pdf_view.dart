import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:resume_app/core/Di/injection.dart';
import 'package:resume_app/core/assets_path/assets.dart';
import 'package:resume_app/core/common/state_renderer/pop_state_dialog_widget.dart';
import 'package:resume_app/core/common/widgets/input_dialogs_body/input_dialog.dart';
import 'package:resume_app/core/common/widgets/separator.dart';
import 'package:resume_app/core/common/widgets/toast/save_file_toast.dart';
import 'package:resume_app/core/doc_manager/doc_path_consts.dart';

import 'package:resume_app/features/pdf_creator/presentation/cubit/pdf_cubit.dart';
import 'package:resume_app/features/pdf_creator/presentation/cubit/pdf_form_state.dart';
import 'package:resume_app/features/pdf_creator/presentation/view/pdf_presentation/pdf_presentation.dart';

class PdfView extends StatelessWidget {
  PdfView({super.key});

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  bool isLoadign = false;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("pdf viewer"),
      ),
      body: Center(
        child: BlocProvider(
          create: (context) =>
              PdfCubit(useCase: getIt(), pdfSaveUseCase: getIt()),
          child: SizedBox(
            height: double.maxFinite,
            child: BlocListener<PdfCubit, PdfState>(
              listener: (context, state) {
                if (state.state is PdfLoading) {
                  if (isLoadign) {
                    showLoadingPopUpDialog(context, navigatorKey: navigatorKey);
                    isLoadign = false;
                  }
                } else {
                  if (isLoadign) {
                    Navigator.of(context).pop();
                  }
                }
                if (state.state is PdfFailure) {
                  PdfFailure failueState = state.state as PdfFailure;

                  showFailurePopUpDialog(context, failueState.failure.message);
                }
                if (state.state is PdfShowToast) {
                  showSaveToast();
                }
                if (state.state is PdfInitState) {}
                if (state.state is ShowPdfState) {
                  var successState = state.state as ShowPdfState;

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              PdfPresentation(bytes: successState.data)));
                }
              },
              child: BlocBuilder<PdfCubit, PdfState>(
                builder: (context, state) {
                  return Container(
                    width: screenWidth * 0.9,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        FormSeparator(screenHeight: screenHeight),
                        const Center(
                            child: Text(
                                "congratulation Your Resume  is ready !! ")),
                        FormSeparator(screenHeight: screenHeight),
                        SvgPicture.asset(
                          Assets.assetsResumeIcon,
                          height: screenHeight * 0.25,
                        ),
                        FormSeparator(screenHeight: screenHeight),
                        ElevatedButton(
                            onPressed: () {
                              context.read<PdfCubit>().getPdf();
                            },
                            child: const Text("show pdf")),
                        FormSeparator(screenHeight: screenHeight),
                        ElevatedButton(
                            onPressed: () {
                              showInputDialog(context,
                                      title: "pdf name: ", readyText: "")
                                  .then((pdfname) {
                                if (pdfname is String) {
                                  context.read<PdfCubit>().savePdf(pdfname);
                                }
                              });
                            },
                            child: const Text("Save pdf")),
                        FormSeparator(screenHeight: screenHeight),
                        Visibility(
                            visible: state.isFileSaved,
                            child: const Center(
                              child: Text(
                                  "the file is saved at: Device${DocPathConsts.outPutFolder} "),
                            ))
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
