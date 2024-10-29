import 'package:flutter/material.dart';
import 'package:resume_app/core/common/widgets/separator.dart';
import 'package:resume_app/core/theme_manager/color_manager.dart';

class LanguageView extends StatelessWidget {
  const LanguageView({
    super.key,
    required this.onDelete,
    required this.screenWidth,
    required this.screenHeight,
    required this.languages,
  });

  final double screenWidth;
  final double screenHeight;
  final Map<String, String> languages;
  final Function(String) onDelete; // Takes the language key to delete

  @override
  Widget build(BuildContext context) {
    return Column(
      children: languages.entries.map((entry) {
        final language = entry.key;
        final level = entry.value;

        return Column(
          children: [
            Container(
              color: ColorManager.textColorInputBackGround,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: screenWidth * 0.7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            language,
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(color: ColorManager.textColor),
                          ),
                          Text(
                            level,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: ColorManager.textColorInput),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      onDelete(language);
                    },
                    icon: Icon(
                      Icons.cancel_rounded,
                      color: ColorManager.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            FormSeparator(screenHeight: screenHeight),
          ],
        );
      }).toList(),
    );
  }
}
