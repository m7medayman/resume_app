import 'package:flutter/material.dart';
import 'package:resume_app/core/constants/app_string_constats.dart';

class MyAlertDialogPopUp extends StatefulWidget {
  final String title;
  final String content;
  final List<Widget> actions;
  final BuildContext context;

  const MyAlertDialogPopUp({
    super.key,
    required this.title,
    required this.content,
    required this.actions,
    required this.context,
  });

  @override
  State<MyAlertDialogPopUp> createState() => _MyAlertDialogPopUpState();
}

class _MyAlertDialogPopUpState extends State<MyAlertDialogPopUp> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title, style: Theme.of(context).textTheme.bodyMedium),
      content: Text(
        widget.content,
        style: Theme.of(context).textTheme.bodySmall,
        overflow: TextOverflow.fade,
      ),
      actions: widget.actions,
    );
  }
}

class LoadingPopUpDialog extends MyAlertDialogPopUp {
  const LoadingPopUpDialog({super.key, required super.context})
      : super(
          title: AppStrings.loading,
          content: AppStrings.loadingContent,
          actions: const [],
        );
}

class ErrorPopUpDialog extends MyAlertDialogPopUp {
  ErrorPopUpDialog({super.key, required super.context, required super.content})
      : super(
          title: AppStrings.error,
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(AppStrings.cancel),
            ),
          ],
        );
}
