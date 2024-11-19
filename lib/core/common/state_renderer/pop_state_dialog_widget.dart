import 'package:flutter/material.dart';
import 'package:resume_app/core/constants/app_string_constats.dart';
import 'package:resume_app/core/theme_manager/color_manager.dart';

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

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("loading"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(
            strokeWidth: 10,
            color: ColorManager.primaryColor,
          ),
        ],
      ),
    );
  }
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

void showLoadingPopUpDialog(context,
    {GlobalKey<NavigatorState>? navigatorKey}) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) {
        return LoadingDialog(
          key: navigatorKey,
        );
      });
}

void showFailurePopUpDialog(context, String content) {
  showDialog(
      context: context,
      builder: (_) {
        return ErrorPopUpDialog(
          content: content,
          context: context,
        );
      });
}
