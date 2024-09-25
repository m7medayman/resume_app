import 'package:flutter/material.dart';
import 'package:resume_app/core/constants/widget_dimensions.dart';

class Separator extends StatelessWidget {
  const Separator({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: WidgetDimensions.separate2 * height,
    );
  }
}
