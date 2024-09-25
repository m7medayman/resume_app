class WidgetDimensions {
  // Button Heights (as percentages of screen height)
  static const double buttonHeight1 = 0.06; // 6% of screen height
  static const double buttonHeight2 = 0.08; // 8% of screen height
  static const double buttonHeight3 = 0.1; // 10% of screen height
  static const double buttonHeight4 = 0.12; // 12% of screen height

  // Button Widths (as percentages of screen width)
  static const double buttonWidth1 = 0.4; // 40% of screen width
  static const double buttonWidth2 = 0.5; // 50% of screen width
  static const double buttonWidth3 = 0.6; // 60% of screen width
  static const double buttonWidth4 = 0.7; // 70% of screen width

  // Dialog Heights (as percentages of screen height)
  static const double dialogHeight1 = 0.4; // 40% of screen height
  static const double dialogHeight2 = 0.5; // 50% of screen height
  static const double dialogHeight3 = 0.6; // 60% of screen height
  static const double dialogHeight4 = 0.7; // 70% of screen height

  // Dialog Widths (as percentages of screen width)
  static const double dialogWidth1 = 0.6; // 60% of screen width
  static const double dialogWidth2 = 0.7; // 70% of screen width
  static const double dialogWidth3 = 0.8; // 80% of screen width
  static const double dialogWidth4 = 0.9; // 90% of screen width

  // Card Heights (as percentages of screen height)
  static const double cardHeight1 = 0.1; // 10% of screen height
  static const double cardHeight2 = 0.15; // 15% of screen height
  static const double cardHeight3 = 0.2; // 20% of screen height
  static const double cardHeight4 = 0.25; // 25% of screen height

  // Card Widths (as percentages of screen width)
  static const double cardWidth1 = 0.25; // 25% of screen width
  static const double cardWidth2 = 0.35; // 35% of screen width
  static const double cardWidth3 = 0.45; // 45% of screen width
  static const double cardWidth4 = 0.55; // 55% of screen width

  // Container Heights (as percentages of screen height)
  static const double containerHeight1 = 0.05; // 5% of screen height
  static const double containerHeight2 = 0.1; // 10% of screen height
  static const double containerHeight3 = 0.15; // 15% of screen height
  static const double containerHeight40 = 0.4; // 20% of screen height

  // Container Widths (as percentages of screen width)
  static const double containerWidth1 = 0.3; // 30% of screen width
  static const double containerWidth2 = 0.4; // 40% of screen width
  static const double containerWidth3 = 0.5; // 50% of screen width
  static const double containerWidth4 = 0.6; // 60% of screen width

  // TextField Heights (as percentages of screen height)
  static const double textFieldHeight1 = 0.06; // 6% of screen height
  static const double textFieldHeight2 = 0.08; // 8% of screen height
  static const double textFieldHeight3 = 0.1; // 10% of screen height
  static const double textFieldHeight4 = 0.12; // 12% of screen height

  // TextField Widths (as percentages of screen width)
  static const double textFieldWidth1 = 0.5; // 50% of screen width
  static const double textFieldWidth2 = 0.6; // 60% of screen width
  static const double textFieldWidth3 = 0.7; // 70% of screen width
  static const double textFieldWidth4 = 0.8; // 80% of screen width
  // free percent
  static const double percent90 = 0.9;
// separate height
  static const double separate1 = 0.01;
  static const double separate2 = 0.02;
  static const double separate3 = 0.03;
  static const double separate5 = 0.05;
  static const double separate10 = 0.1;
  static const double separate15 = 0.15;
  // Method to get dimension based on screen size
  static double getResponsiveHeight(double percentage, double screenHeight) {
    return screenHeight * percentage;
  }

  static double getResponsiveWidth(double percentage, double screenWidth) {
    return screenWidth * percentage;
  }
}
