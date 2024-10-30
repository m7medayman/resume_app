import 'package:flutter/material.dart';

class EnhanceButton extends StatelessWidget {
  const EnhanceButton(
      {super.key, required this.formKey, required this.onPressed});

  final void Function() onPressed;
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          if (formKey.currentState!.validate()) {
            onPressed();
          }
        },
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Icon(Icons.auto_fix_high), Text("Enhance")],
        ));
  }
}
