import 'package:flutter/material.dart';
import 'package:resume_app/core/theme_manager/color_manager.dart';

class HiddenButton extends StatelessWidget {
  HiddenButton({
    required this.screenHeight,
    required this.childWidget,
    required this.isHidden,
    required this.onPressed,
    super.key,
  });
  void Function()? onPressed;
  bool isHidden;
  Widget childWidget;
  double screenHeight;
  @override
  Widget build(BuildContext context) {
    return isHidden
        ? Container()
        : Container(
            height: 0.07 * screenHeight,
            child: ElevatedButton(
                onPressed: onPressed,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.add_circle_outline,
                      color: ColorManager.textColor,
                    ),
                    childWidget,
                  ],
                )),
          );
  }
}
