import 'dart:io';

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
              child: const Text(AppStrings.close),
            ),
          ],
        );
}

class FilePermissionDeniedDialog extends MyAlertDialogPopUp {
  final void Function()? givePermissionFunction;

  FilePermissionDeniedDialog(
      {super.key, required super.context, required this.givePermissionFunction})
      : super(actions: [
          ElevatedButton(
              onPressed: () {
                exit(0);
              },
              child: const Text("exit")),
          ElevatedButton(
              onPressed: givePermissionFunction,
              child: const Text("give permission"))
        ], title: "file permission", content: "file permission denied");
}

void showLoadingPopUpDialog(context,
    {GlobalKey<NavigatorState>? navigatorKey}) {
  showDialog(
      barrierDismissible: false,
      context: context,

      builder: (_) {
        return PopScope(
          canPop: false,
          child: LoadingDialog(
            key: navigatorKey,
          ),
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

void showFilePermissionDeniedDialog(
    BuildContext context, void Function()? givePermissionFunction) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) {
        return FilePermissionDeniedDialog(
            context: context, givePermissionFunction: givePermissionFunction);
      });
}
