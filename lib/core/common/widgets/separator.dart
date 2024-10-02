import 'package:flutter/material.dart';

import 'package:resume_app/core/constants/widget_dimensions.dart';

class FormSeparator extends StatelessWidget {
  const FormSeparator({
    super.key,
    required this.screenHeight,
  });

  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: WidgetDimensions.separate2 * screenHeight,
    );
  }
}

class BigFormSeparator extends StatelessWidget {
  final double screenHeight;
  const BigFormSeparator({
    Key? key,
    required this.screenHeight,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight * WidgetDimensions.separate15,
    );
  }
}
