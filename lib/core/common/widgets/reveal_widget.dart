import 'package:flutter/material.dart';
import 'package:resume_app/core/common/widgets/separator.dart';

class RevealField extends StatelessWidget {
  const RevealField({
    super.key,
    required this.cancelFunction,
    required this.isHidden,
    required this.child,
    required this.screenHeight,
  });

  final double screenHeight;
  final bool isHidden;
  final Widget child;
  final void Function()? cancelFunction;

  @override
  Widget build(BuildContext context) {
    return isHidden
        ? Container()
        : Column(
            children: [
              FormSeparator(screenHeight: screenHeight),
              Row(
                children: [
                  Expanded(child: child),
                  IconButton(
                      onPressed: cancelFunction,
                      icon: const Icon(Icons.cancel_outlined))
                ],
              ),
              FormSeparator(screenHeight: screenHeight),
            ],
          );
  }
}
