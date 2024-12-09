import 'dart:io';

import 'package:flutter/material.dart';
import 'package:resume_app/core/doc_manager/docs_manager_and_permission.dart';

/// Show an alert dialog when permission is denied
class AlertDialogStoragePermission {
  static void showPermissionDialog() {
    final context = GlobalKey<NavigatorState>();

    showDialog(
      context: context.currentState!.context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text('Permission Required'),
          content: const Text(
            'Storage permission is required to create the folder. Please allow storage permission in the app settings.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                DocsManagerAndPermissions
                    .requestStoragePermission(); // Redirect to app settings
              },
              child: const Text('Settings'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                exit(0); // Close the app
              },
              child: const Text('Close App'),
            ),
          ],
        );
      },
    );
    }
}
