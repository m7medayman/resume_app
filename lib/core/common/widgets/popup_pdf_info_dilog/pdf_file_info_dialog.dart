import 'package:flutter/material.dart';
import 'package:resume_app/core/common/widgets/separator.dart';
import 'package:resume_app/core/doc_manager/doc_path_consts.dart';
import 'package:resume_app/core/routing/routes_manager.dart';
import 'package:resume_app/core/theme_manager/color_manager.dart';

class PdfFileInfoDialog extends StatelessWidget {
  const PdfFileInfoDialog(
      {super.key,
      required this.screenHeight,
      required this.screenWidth,
      required this.pdfName,
      required this.pdfFilePath});
  final double screenHeight;
  final double screenWidth;
  final String pdfName;
  final String pdfFilePath;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            color: ColorManager.backgroundColor,
            borderRadius: BorderRadius.circular(13)),
        width: screenWidth * 0.8,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("pdf Name: $pdfName"),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    "pdf Path :  internal storage${DocPathConsts.outPutFolder}/$pdfName"),
              ),
              const Divider(),
              FormSeparator(screenHeight: screenHeight),
              Center(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(Routes.pdfFileView,
                          arguments: pdfFilePath);
                    },
                    child: const Text("open pdf")),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
