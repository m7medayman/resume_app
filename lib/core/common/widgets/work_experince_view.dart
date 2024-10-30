import 'package:flutter/material.dart';
import 'package:resume_app/core/common/widgets/separator.dart';
import 'package:resume_app/core/data_classes/work_experience.dart';
import 'package:resume_app/core/theme_manager/color_manager.dart';

class WorkExperienceView extends StatelessWidget {
  const WorkExperienceView(
      {super.key,
      required this.onDelete,
      required this.screenWidth,
      required this.screenHeight,
      required this.workExperiences});

  final double screenWidth;
  final double screenHeight;
  final List<WorkExperience> workExperiences;
  final Function(WorkExperience) onDelete;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: workExperiences.map((element) {
        return Column(
          children: [
            Container(
              color: ColorManager.textColorInputBackGround,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: screenWidth * 0.7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${element.title}",
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(color: ColorManager.textColor),
                          ),
                          Text(
                              "${element.startDate.year}-${element.startDate.month} to ${element.endDate.year}-${element.endDate.month}",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      color: ColorManager.textColorInput)),
                          Text(
                            element.description,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: ColorManager.textColorInput),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {
                        onDelete(element);
                      },
                      icon: Icon(
                        Icons.cancel_rounded,
                        color: ColorManager.primaryColor,
                      ))
                ],
              ),
            ),
            FormSeparator(screenHeight: screenHeight)
          ],
        );
      }).toList(),
    );
  }
}
