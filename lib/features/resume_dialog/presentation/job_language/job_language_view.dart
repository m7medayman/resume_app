import 'package:flutter/material.dart';
import 'package:resume_app/core/common/widgets/language_select.dart';
import 'package:resume_app/core/common/widgets/language_view.dart';
import 'package:resume_app/core/common/widgets/separator.dart';
import 'package:resume_app/features/resume_dialog/presentation/cubit/resume_dialog_cubit.dart';

class JobLanguagesView extends StatelessWidget {
  const JobLanguagesView({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.cubit,
    required this.state,
  });

  final ResumeDialogCubit cubit;
  final ResumeDialogState state;
  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Languages",
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            FormSeparator(screenHeight: screenHeight),
            LanguageView(
              languages: state.language,
              screenWidth: screenWidth,
              screenHeight: screenHeight,
              onDelete: cubit.deleteLanguage,
            ),
            BigFormSeparator(screenHeight: screenHeight),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) {
                        return const Dialog(
                          child: LanguageSelectionDialog(),
                        );
                      },
                    ).then((value) {
                      if (value is Map<String, String>) {
                        cubit.addLanguage(value.keys.first, value.values.first);
                      }
                    });
                  },
                  child: const Text("+ Add Language"),
                ),
              ],
            ),
            FormSeparator(screenHeight: screenHeight),
            const Divider(),
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
          ],
        ),
      ),
    );
  }
}
