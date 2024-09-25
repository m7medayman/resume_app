import 'package:flutter/material.dart';

class AppBarText extends StatelessWidget {
  final String content;
  AppBarText({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: Theme.of(context).textTheme.headlineLarge,
    );
  }
}

class BodyText extends StatelessWidget {
  final String content;
  const BodyText({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }
}
