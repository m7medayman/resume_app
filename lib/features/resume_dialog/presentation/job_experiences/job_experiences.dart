import 'package:flutter/material.dart';
import 'package:resume_app/core/common/widgets/input_dialogs_body/project_experience_input.dart';
import 'package:resume_app/core/common/widgets/project_experience_view.dart';
import 'package:resume_app/core/common/widgets/separator.dart';
import 'package:resume_app/core/common/widgets/work_experince_view.dart';
import 'package:resume_app/core/common/widgets/input_dialogs_body/wrokExperience_input.dart';
import 'package:resume_app/core/data_classes/pdf_data_class.dart';
import 'package:resume_app/core/data_classes/project_experience.dart';
import 'package:resume_app/core/data_classes/work_experience.dart';
import 'package:resume_app/core/routing/routes_manager.dart';
import 'package:resume_app/features/resume_dialog/presentation/cubit/resume_dialog_cubit.dart';

class JobExperiences extends StatelessWidget {
  const JobExperiences(
      {super.key,
      required this.screenHeight,
      required this.screenWidth,
      required this.cubit,
      required this.state});
  final ResumeDialogCubit cubit;
  final ResumeDialogState state;
  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "Certifications and Degrees",
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        FormSeparator(screenHeight: screenHeight),
        WorkExperienceView(
            onDelete: cubit.deleteWorkExperience,
            screenWidth: screenWidth,
            screenHeight: screenHeight,
            workExperiences: state.punchOfWorkExperiences),
        FormSeparator(screenHeight: screenHeight),
        ProjectExperienceView(
            onDelete: cubit.deleteProjectExperience,
            screenWidth: screenWidth,
            screenHeight: screenHeight,
            workExperiences: state.punchOfProjectExperiences),
        FormSeparator(screenHeight: screenHeight),
        Center(
          child: Wrap(
            children: [
              ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (_) {
                          return Dialog(
                            child: WorkExperienceInputDialog(
                              screenHeight: screenHeight,
                              screenWidth: screenWidth,
                              enhanceFunction: cubit.getJobExperienceEnhanced,
                            ),
                          );
                        }).then((value) {
                      WorkExperience? returnedValue = value as WorkExperience?;
                      if (returnedValue != null) {
                        cubit.addWorkExperience(returnedValue);
                      }
                    });
                  },
                  child: const Text("+ add Work Experience")),
              ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (_) {
                          return Dialog(
                            child: ProjectExperienceInputDialog(
                              screenHeight: screenHeight,
                              screenWidth: screenWidth,
                              enhanceFunction: cubit.getJobExperienceEnhanced,
                            ),
                          );
                        }).then((value) {
                      ProjectExperience? returnedValue =
                          value as ProjectExperience?;
                      if (returnedValue != null) {
                        cubit.addProjectExperience(returnedValue);
                      }
                    });
                  },
                  child: const Text("+ add project Experience")),
            ],
          ),
        ),
        FormSeparator(screenHeight: screenHeight),
        const Divider(),
        FormSeparator(screenHeight: screenHeight),
        Row(
          children: [
            ElevatedButton(
                onPressed: () {
                  cubit.goBack();
                },
                child: const Text("Back")),
            const Spacer(),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(Routes.pdfView,
                      arguments: PdfData(
                          jobTitle: state.jobTitle,
                          jobSummery: state.jobSummery,
                          language: state.language,
                          selectedEducationInfo: state.selectedEducationInfo,
                          userInfo: state.userInfo!,
                          selectedHardSkills:
                              state.selectedHardSkills.keys.toList(),
                          selectedSoftSkills:
                              state.selectedSoftSkills.keys.toList(),
                          punchOfWorkExperiences: state.punchOfWorkExperiences,
                          punchOfProjectExperience:
                              state.punchOfProjectExperiences));
                },
                child: const Text("Next")),
          ],
        ),
      ]),
    ));
  }
}
