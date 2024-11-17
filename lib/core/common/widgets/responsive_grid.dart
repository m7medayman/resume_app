import 'package:flutter/material.dart';

class ResponsiveGrid extends StatefulWidget {
  final List<String> texts; // List of strings passed to the widget

  const ResponsiveGrid({super.key, required this.texts});

  @override
  _ResponsiveGridState createState() => _ResponsiveGridState();
}

class _ResponsiveGridState extends State<ResponsiveGrid> {
  // Function to calculate the width of a text
  double _calculateTextWidth(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size.width;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double availableWidth = constraints
            .maxWidth; // Available width in the grid // Fixed height for each grid item
        double spacing = 8.0; // Space between items
        double padding = 16.0; // Padding for the grid

        // List to store the buttons that fit within the available width
        List<Widget> buttons = [];

        // Add buttons only if they can fit within the available width
        double currentRowWidth = 0;
        List<Widget> currentRowItems = [];

        for (String text in widget.texts) {
          TextStyle buttonTextStyle = const TextStyle(fontSize: 16);
          double buttonWidth =
              _calculateTextWidth(text, buttonTextStyle) + padding;

          if (currentRowWidth + buttonWidth > availableWidth) {
            // If adding this button exceeds the available width, start a new row
            buttons.add(Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: currentRowItems,
            ));
            currentRowItems = []; // Start a new row
            currentRowWidth = 0;
          }

          currentRowItems.add(_buildButton(text));
          currentRowWidth += buttonWidth + spacing; // Update row width
        }

        // Add the last row if it's not empty
        if (currentRowItems.isNotEmpty) {
          buttons.add(Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: currentRowItems,
          ));
        }

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: buttons,
          ),
        );
      },
    );
  }

  // Function to build each button
  Widget _buildButton(String text) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ElevatedButton(
        onPressed: () {},
        child: Text(text),
      ),
    );
  }
}
