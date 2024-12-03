import 'dart:ffi';
import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:either_dart/either.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:resume_app/core/common/widgets/alert_dialog_without_context.dart';
import 'package:resume_app/core/doc_manager/doc_path_consts.dart';
import 'package:resume_app/core/resources/failure/failure_model.dart';
import 'package:resume_app/core/resources/failure/system_failure_const.dart';

class DocsManagerAndPermissions {
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

  static Future<bool> _checkPermission() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    if (androidInfo.version.sdkInt >= 30) {
      return Permission.manageExternalStorage.isGranted;
    } else {
      return Permission.storage.isGranted;
    }
  }

  /// Creates a directory in external storage if the permission is granted
  static Future<Either<Failure, String>> createFileInExternalStorage() async {
    try {
      // Check if the storage permission is already granted
      var permissionStatus = await _checkPermission();

      if (permissionStatus) {
        // Define the base directory as /storage/emulated/0

        // Create the custom folder
        final customFolder = Directory(DocPathConsts.fullPathFolder);
        if (!(await customFolder.exists())) {
          await customFolder.create();
        }
        print("Folder created at: ${customFolder.path}");
        return Right(customFolder.path);
      } else {
        return Left(SystemFailureConstants.systemPermissionDenied);
      }
    } catch (e) {
      throw Exception("Error creating directory: $e");
    }
  }
}
