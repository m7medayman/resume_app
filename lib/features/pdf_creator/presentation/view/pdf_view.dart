import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resume_app/core/Di/injection.dart';
import 'package:resume_app/core/common/state_renderer/pop_state_dialog_widget.dart';
import 'package:resume_app/features/pdf_creator/presentation/cubit/pdf_cubit.dart';
import 'package:resume_app/features/pdf_creator/presentation/cubit/pdf_form_state.dart';
import 'package:resume_app/features/pdf_creator/presentation/view/pdf_presentation/pdf_presentation.dart';

class PdfView extends StatelessWidget {
  PdfView({super.key});

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    bool isLoadign = false;
    return Scaffold(
      appBar: AppBar(
        title: const Text("pdf viewer"),
      ),
      body: BlocProvider(
        create: (context) => PdfCubit(getIt()),
        child: SizedBox(
          height: double.maxFinite,
          child: BlocListener<PdfCubit, PdfState>(
            listener: (context, state) {
              if (state.state is PdfLoading) {
                showLoadingPopUpDialog(context, navigatorKey: navigatorKey);
              }
              if (state.state is PdfFailure) {
                PdfFailure failueState = state.state as PdfFailure;
                showFailurePopUpDialog(context, failueState.failure.message);
              }
              if (state.state is PdfInitState) {
                if (navigatorKey.currentContext != null) {
                  print("test");
                  Navigator.of(navigatorKey.currentContext!).pop();
                }
              }
              if (state.state is PdfSuccess) {
                PdfSuccess successState = state.state as PdfSuccess;
                if (navigatorKey.currentContext != null) {
                  Navigator.of(navigatorKey.currentContext!).pop();
                }

                 Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            PdfPresentation(bytes: successState.data)));
              }
            },
            child: BlocBuilder<PdfCubit, PdfState>(
              builder: (context, state) {
                return Column(
                  children: [
                    Text("test"),
                    ElevatedButton(
                        onPressed: () {
                          context.read<PdfCubit>().getPdf();
                        },
                        child: const Text("get pdf"))
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
