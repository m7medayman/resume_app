import 'package:flutter/material.dart';

class ResumeView extends StatelessWidget {
  const ResumeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("pdf viewer"),
      ),
      body: Container(
        height: double.maxFinite,
        child: Column(
          children: [
            ElevatedButton(onPressed: () {}, child: const Text("get pdf"))
          ],
        ),
      ),
    );
  }
}
