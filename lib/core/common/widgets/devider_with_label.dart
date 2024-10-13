import 'package:flutter/material.dart';
import 'package:resume_app/core/constants/app_sizes_constants.dart';
import 'package:resume_app/core/theme_manager/color_manager.dart';

class DividerWithLabel extends StatelessWidget {
  const DividerWithLabel({super.key, required this.label});

  final String label;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const Expanded(
          child: Divider(
            thickness: AppSize.s1,
            color: ColorManager.textColor,
          ),
        )
      ],
    );
  }
}
