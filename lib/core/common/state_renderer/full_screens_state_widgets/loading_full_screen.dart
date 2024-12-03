import 'package:flutter/material.dart';
import 'package:resume_app/core/common/widgets/separator.dart';
import 'package:resume_app/core/theme_manager/color_manager.dart';

class LoadingFullScreen extends StatelessWidget {
  const LoadingFullScreen({super.key, required this.isVisable});
  final bool isVisable;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisable,
      child: const Expanded(child: LoadingContent()),
    );
  }
}

class LoadingContent extends StatelessWidget {
  const LoadingContent({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Material(
      color: Colors.black.withOpacity(0.6), // Semi-transparent background
      child: Center(
        child: Container(
          width: screenWidth * 0.7,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: ColorManager.backgroundColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Loading...",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              FormSeparator(screenHeight: screenHeight),
              CircularProgressIndicator(
                strokeWidth: 10,
                color: ColorManager
                    .primaryColor, // Replace with your color manager if needed
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
