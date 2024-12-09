import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resume_app/core/Di/injection.dart';
import 'package:resume_app/core/common/state_renderer/pop_state_dialog_widget.dart';
import 'package:resume_app/features/resume_dialog/presentation/cubit/resume_dialog_cubit.dart';
import 'package:resume_app/features/resume_dialog/presentation/cubit/resume_form_state.dart';
import 'package:resume_app/features/resume_dialog/presentation/job_certification_and_cources/job_certification_and_courses.dart';
import 'package:resume_app/features/resume_dialog/presentation/job_description/job_description.dart';
import 'package:resume_app/features/resume_dialog/presentation/job_experiences/job_experiences.dart';
import 'package:resume_app/features/resume_dialog/presentation/job_language/job_language_view.dart';
import 'package:resume_app/features/resume_dialog/presentation/job_summary/job_summary.dart';
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

  GlobalKey<FormState> formKeyJobSummary = GlobalKey();
  TextEditingController textEditingControllerJobSummary =
      TextEditingController();
  int _currentPageIndex = 0;
  late ResumeDialogCubit resumeDialogCubit;
  @override
  void initState() {
    resumeDialogCubit = ResumeDialogCubit(
        jobDescriptionUseCases: getIt(),
        jobSummaryUseCase: getIt(),
        jobExperienceEnhanceUseCase: getIt());
    super.initState();

    _pageViewController = PageController();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _pageViewController.dispose();
    _tabController.dispose();
    resumeDialogCubit.close();

    super.dispose();
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

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (context) => resumeDialogCubit,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Job Application"),
        ),
        body: BlocListener<ResumeDialogCubit, ResumeDialogState>(
          listener: (context, state) {
            var resumeFormState = state.resumeFormState;
            if (resumeFormState is LoadingResumeFormState) {
              showLoadingPopUpDialog(context);
              isLoading = true;
            } else {
              if (isLoading) {
                Navigator.of(context).pop();
                isLoading = false;
              }
            }
            if (resumeFormState is GoBackFormState) {
              _pageViewController.previousPage(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut);
              _currentPageIndex--;
            }
            if (resumeFormState is FailureResumeFormState) {
              showFailurePopUpDialog(context, resumeFormState.errorMessage);
            }
            if (resumeFormState is SuccessResumeFormStateJobSummary) {
              textEditingControllerJobSummary.text = resumeFormState.jobSummary;
            }
            if (resumeFormState is GoForwardFormState) {
              _currentPageIndex++;
              _pageViewController.nextPage(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut);
              _doBeforeGoingToPage(1, () {
                textEditingControllerJobTitle.text = state.jobInfoAi.jobTitle;
              });
            }
          },
          child: BlocBuilder<ResumeDialogCubit, ResumeDialogState>(
            builder: (context, state) {
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
                          physics: const NeverScrollableScrollPhysics(),
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
                                state: state),
                            JobSummary(
                                cubit: context.read<ResumeDialogCubit>(),
                                onFinished: () {},
                                screenHeight: screenHeight,
                                formKey: formKeyJobSummary,
                                jobDescriptionTextController:
                                    textEditingControllerJobSummary),
                            JobCertificationAndCourses(
                              screenHeight: screenHeight,
                              screenWidth: screenWidth,
                              cubit: context.read<ResumeDialogCubit>(),
                              state: state,
                            ),
                            JobLanguagesView(
                                screenHeight: screenHeight,
                                screenWidth: screenWidth,
                                cubit: context.read<ResumeDialogCubit>(),
                                state: state),
                            JobExperiences(
                              screenHeight: screenHeight,
                              screenWidth: screenWidth,
                              state: state,
                              cubit: context.read<ResumeDialogCubit>(),
                            ),
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
