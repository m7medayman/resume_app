import 'package:fluttertoast/fluttertoast.dart';
import 'package:resume_app/core/theme_manager/color_manager.dart';

void showSaveToast() {
  Fluttertoast.showToast(
    msg: "Congratulations, the resume has been saved successfully!",
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: ColorManager.primaryColor,
    textColor: ColorManager.textColor,
    fontSize: 16.0,
  );
}
