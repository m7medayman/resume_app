import 'package:flutter/material.dart';
import 'package:resume_app/core/common/widgets/course_view_widget.dart';
import 'package:resume_app/core/common/widgets/degree_view_widget.dart';
import 'package:resume_app/core/common/widgets/separator.dart';
import 'package:resume_app/core/common/widgets/work_experince_view.dart';
import 'package:resume_app/core/common/widgets/wrokExperience_input.dart';
import 'package:resume_app/core/data_classes/work_experience.dart';
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
            onDelete: (WorkExperience w) {},
            screenWidth: screenWidth,
            screenHeight: screenHeight,
            workExperiences: state.punchOfWorkExperiences),
        // DegreeView(
        //     onDelete: cubit.deleteDegree,
        //     degrees: state.selectedEducationInfo.degrees!,
        //     screenWidth: screenWidth,
        //     screenHeight: screenHeight),
        // CourseView(
        //   courses: state.selectedEducationInfo.courses!,
        //   screenWidth: screenWidth,
        //   screenHeight: screenHeight,
        //   onDelete: cubit.deleteCourse,
        // ),
        FormSeparator(screenHeight: screenHeight),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
            // ElevatedButton(
            //     onPressed: () {
            //       showDialog(
            //           context: context,
            //           builder: (_) {
            //             return Dialog(
            //               child: CourseCertificationInputDialog(
            //                   screenHeight: screenHeight,
            //                   screenWidth: screenWidth),
            //             );
            //           }).then((value) {
            //         Course? returendValue = value as Course?;
            //         if (returendValue != null) {
            //           cubit.addCourse(returendValue);
            //           print(value!.title);
            //         }
            //       });
            //     },
            //     child: const Text("+ add course")),
          ],
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
                  cubit.getNextPage();
                },
                child: const Text("Next")),
          ],
        ),
      ]),
    ));
  }
}
