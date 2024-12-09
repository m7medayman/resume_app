import 'package:flutter/material.dart';
import 'package:resume_app/core/theme_manager/color_manager.dart';

class HiddenButton extends StatelessWidget {
  const HiddenButton({
    required this.screenHeight,
    required this.childWidget,
    required this.isHidden,
    required this.onPressed,
    super.key,
  });
  final void Function()? onPressed;
  final bool isHidden;
  final Widget childWidget;
  final double screenHeight;
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !isHidden,
      child: SizedBox(
        height: 0.07 * screenHeight,
        child: ElevatedButton(
            onPressed: onPressed,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Icon(
                  Icons.add_circle_outline,
                  color: ColorManager.textColor,
                ),
                childWidget,
              ],
            )),
      ),
    );
  }
}
