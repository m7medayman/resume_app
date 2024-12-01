import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:resume_app/core/common/widgets/alert_dialog_without_context.dart';

class DocsManagerAndPermissions {
  static const String folderName = "GeneratedPDFs";
  static Future<void> requestStoragePermission() async {
    if (Platform.isAndroid) {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

      if (androidInfo.version.sdkInt >= 30) {
        // For Android 11 and above, request MANAGE_EXTERNAL_STORAGE permission
        if (!await Permission.manageExternalStorage.isGranted) {
          await Permission.manageExternalStorage.request();
        }
      } else {
        // For Android versions below 11, request READ/WRITE_EXTERNAL_STORAGE permissions
        if (!await Permission.storage.isGranted) {
          await Permission.storage.request();
        }
      }
    }
  }

  static Future<bool> checkPermission() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    if (androidInfo.version.sdkInt >= 30) {
      return Permission.manageExternalStorage.isGranted;
    } else {
      return Permission.storage.isGranted;
    }
  }

  /// Creates a directory in external storage if the permission is granted
  static Future<void> createFileInExternalStorage() async {
    try {
      // Check if the storage permission is already granted
      var permissionStatus = await checkPermission();

      if (permissionStatus) {
        // Define the base directory as /storage/emulated/0
        final baseDirectory = Directory('/storage/emulated/0');

        // Create the custom folder
        final customFolder = Directory('${baseDirectory.path}/$folderName');
        if (!(await customFolder.exists())) {
          await customFolder.create();
        }
        print("Folder created at: ${customFolder.path}");
      } else {
        AlertDialogStoragePermission.showPermissionDialog();
      }
    } catch (e) {
      throw Exception("Error creating directory: $e");
    }
  }
}
