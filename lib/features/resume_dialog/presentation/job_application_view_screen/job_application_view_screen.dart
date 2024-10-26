import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resume_app/core/Di/injection.dart';
import 'package:resume_app/core/common/state_renderer/pop_state_dialog_widget.dart';
import 'package:resume_app/core/common/widgets/separator.dart';
import 'package:resume_app/features/resume_dialog/presentation/cubit/resume_dialog_cubit.dart';
import 'package:resume_app/features/resume_dialog/presentation/cubit/resume_form_state.dart';
import 'package:resume_app/features/resume_dialog/presentation/job_description/job_description.dart';
import 'package:resume_app/features/resume_dialog/presentation/skills_picker/skills_picker.dart';

class JobApplicationViewScreen extends StatefulWidget {
  const JobApplicationViewScreen({super.key});

  @override
  State<JobApplicationViewScreen> createState() =>
      _JobApplicationViewScreenState();
}

class _JobApplicationViewScreenState extends State<JobApplicationViewScreen>
    with SingleTickerProviderStateMixin {
  late PageController _pageViewController;
  late TabController _tabController;
  GlobalKey<FormState> formKeyJobDescription = GlobalKey();
  TextEditingController textEditingControllerJobDescription =
      TextEditingController();
  GlobalKey<FormState> formKeyJobTitle = GlobalKey();
  TextEditingController textEditingControllerJobTitle = TextEditingController();
  int _currentPageIndex = 0;
  @override
  void initState() {
    super.initState();
    _pageViewController = PageController();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
    _tabController.dispose();
  }

  void _updateCurrentPageIndex(int index) {
    _tabController.index = index;
    _pageViewController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  void _doBeforeGoingToPage(int n, void Function() ongoing) {
    if (_currentPageIndex == n) {
      ongoing();
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (context) => ResumeDialogCubit(getIt()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Job Application"),
        ),
        body: BlocListener<ResumeDialogCubit, ResumeDialogState>(
          listener: (context, state) {
            var resumeFormState = state.resumeFormState;
            if (resumeFormState is LoadingResumeFormState) {
              showLoadingPopUpDialog(context);
            }
            if (resumeFormState is ErrorResumeFormState) {
              showFailurePopUpDialog(context, resumeFormState.errorMessage);
            }
            if (resumeFormState is SuccessResumeFormState) {
              print("=++++++++++++++++++++++++++++++++++++ success");
              Navigator.of(context).pop();
              _currentPageIndex++;
              _pageViewController.nextPage(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut);
              _doBeforeGoingToPage(1, () {
                textEditingControllerJobTitle.text = state.jobInfoAi!.jobTitle;
              });
            }
          },
          child: BlocBuilder<ResumeDialogCubit, ResumeDialogState>(
            builder: (context, state) {
              print('bloc build');
              return Center(
                child: SingleChildScrollView(
                  child: SizedBox(
                    height: screenHeight * 0.8,
                    width: screenWidth * 0.9,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        // Wrap the PageView with BlocBuilder to have access to the Cubit
                        PageView(
                          physics: NeverScrollableScrollPhysics(),
                          controller: _pageViewController,
                          children: [
                            JobDescription(
                              onFinished: () {
                                if (formKeyJobDescription.currentState!
                                    .validate()) {
                                  // Access the Cubit within the correct BuildContext
                                  context
                                      .read<ResumeDialogCubit>()
                                      .getJobDetails(
                                          textEditingControllerJobDescription
                                              .text);
                                }
                              },
                              screenHeight: screenHeight,
                              formKey: formKeyJobDescription,
                              jobDescriptionTextController:
                                  textEditingControllerJobDescription,
                            ),
                            JobSkillPicker(
                                onFinished: () {},
                                screenWidth: screenWidth,
                                screenHeight: screenHeight,
                                fieldFormKey: formKeyJobTitle,
                                fieldInput: textEditingControllerJobTitle,
                                cubit: context.read<ResumeDialogCubit>(),
                                state: state)
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
