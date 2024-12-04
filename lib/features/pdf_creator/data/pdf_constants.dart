import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PdfFontSize {
  // Commonly used font sizes for a PDF document
  static const double extraSmall = 10;
  static const double small = 12;
  static const double normal = 10;
  static const double medium = 12;
  static const double large = 16;
  static const double extraLarge = 24;
  static const double title = 28;
  static const double headline = 32;

  // Custom sizes for specific use cases
  static const double caption = 8;
  static const double subTitle = 16;
  static const double display = 40;
}

class PdfTextStyles {
  // Extra small text styles
  static const pw.TextStyle extraSmall = pw.TextStyle(
    fontSize: PdfFontSize.extraSmall,
    color: PdfColors.black,
  );
  static pw.TextStyle extraSmallBold = pw.TextStyle(
    fontSize: PdfFontSize.extraSmall,
    fontWeight: pw.FontWeight.bold,
    color: PdfColors.black,
  );
  static pw.TextStyle extraSmallLight = pw.TextStyle(
    fontSize: PdfFontSize.extraSmall,
    fontWeight: pw.FontWeight.normal,
    color: PdfColors.black,
  );

  // Small text styles
  static pw.TextStyle small = const pw.TextStyle(
    fontSize: PdfFontSize.small,
    color: PdfColors.black,
  );
  static pw.TextStyle smallBold = pw.TextStyle(
    fontSize: PdfFontSize.small,
    fontWeight: pw.FontWeight.bold,
    color: PdfColors.black,
  );
  static pw.TextStyle smallLight = pw.TextStyle(
    fontSize: PdfFontSize.small,
    fontWeight: pw.FontWeight.normal,
    color: PdfColors.black,
  );

  // Normal text styles
  static pw.TextStyle normal = const pw.TextStyle(
    fontSize: PdfFontSize.normal,
    color: PdfColors.black,
  );
  static pw.TextStyle normalBold = pw.TextStyle(
    fontSize: PdfFontSize.normal,
    fontWeight: pw.FontWeight.bold,
    color: PdfColors.black,
  );
  static pw.TextStyle normalLight = pw.TextStyle(
    fontSize: PdfFontSize.normal,
    fontWeight: pw.FontWeight.normal,
    color: PdfColors.black,
  );

  // Medium text styles
  static pw.TextStyle medium = const pw.TextStyle(
    fontSize: PdfFontSize.medium,
    color: PdfColors.black,
  );
  static pw.TextStyle mediumBold = pw.TextStyle(
    fontSize: PdfFontSize.medium,
    fontWeight: pw.FontWeight.bold,
    color: PdfColors.black,
  );
  static pw.TextStyle mediumLight = pw.TextStyle(
    fontSize: PdfFontSize.medium,
    fontWeight: pw.FontWeight.normal,
    color: PdfColors.black,
  );

  // Large text styles
  static pw.TextStyle large = const pw.TextStyle(
    fontSize: PdfFontSize.large,
    color: PdfColors.black,
  );
  static pw.TextStyle largeBold = pw.TextStyle(
    fontSize: PdfFontSize.large,
    fontWeight: pw.FontWeight.bold,
    color: PdfColors.black,
  );
  static pw.TextStyle largeLight = pw.TextStyle(
    fontSize: PdfFontSize.large,
    fontWeight: pw.FontWeight.normal,
    color: PdfColors.black,
  );

  // Extra large text styles
  static pw.TextStyle extraLarge = const pw.TextStyle(
    fontSize: PdfFontSize.extraLarge,
    color: PdfColors.black,
  );
  static pw.TextStyle extraLargeBold = pw.TextStyle(
    fontSize: PdfFontSize.extraLarge,
    fontWeight: pw.FontWeight.bold,
    color: PdfColors.black,
  );
  static pw.TextStyle extraLargeLight = pw.TextStyle(
    fontSize: PdfFontSize.extraLarge,
    fontWeight: pw.FontWeight.normal,
    color: PdfColors.black,
  );

  // Title text styles
  static pw.TextStyle title = const pw.TextStyle(
    fontSize: PdfFontSize.title,
    color: PdfColors.black,
  );
  static pw.TextStyle titleBold = pw.TextStyle(
    fontSize: PdfFontSize.title,
    fontWeight: pw.FontWeight.bold,
    color: PdfColors.black,
  );
  static pw.TextStyle titleLight = pw.TextStyle(
    fontSize: PdfFontSize.title,
    fontWeight: pw.FontWeight.normal,
    color: PdfColors.black,
  );

  // Headline text styles
  static pw.TextStyle headline = const pw.TextStyle(
    fontSize: PdfFontSize.headline,
    color: PdfColors.black,
  );
  static pw.TextStyle headlineBold = pw.TextStyle(
    fontSize: PdfFontSize.headline,
    fontWeight: pw.FontWeight.bold,
    color: PdfColors.black,
  );
  static pw.TextStyle headlineLight = pw.TextStyle(
    fontSize: PdfFontSize.headline,
    fontWeight: pw.FontWeight.normal,
    color: PdfColors.black,
  );
}
