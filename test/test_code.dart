import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive Grid Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ResponsiveGridTestPage(),
    );
  }
}

class ResponsiveGridTestPage extends StatelessWidget {
  final List<Widget> sampleWidgets = List.generate(
    10,
    (index) => ElevatedButton(
      onPressed: () {},
      child: Text(
        'Button $index',
        style: TextStyle(
            fontSize: index % 2 == 0 ? 14 : 20), // Some varying text lengths
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Responsive Grid Test Page'),
      ),
      body: ResponsiveGrid(children: sampleWidgets),
    );
  }
}

class ResponsiveGrid extends StatefulWidget {
  final List<Widget> children;
  late List<GlobalKey> keysList;
  List<Widget> newChildren = [];

  ResponsiveGrid({required this.children}) {
    keysList = List.generate(children.length, (index) => GlobalKey());

    for (int i = 0; i < children.length; i++) {
      newChildren.add(Container(
        child: children[i],
        key: keysList[i],
      ));
    }
  }

  @override
  _ResponsiveGridState createState() => _ResponsiveGridState();
}

class _ResponsiveGridState extends State<ResponsiveGrid> {
  bool hasRendered = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        hasRendered = true;
      });
    });
  }

  double _calculateWidth(GlobalKey key) {
    final renderBox = key.currentContext?.findRenderObject() as RenderBox?;
    return renderBox?.size.width ?? 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double availableWidth = constraints.maxWidth;

        List<Widget> buttons = [];
        double currentRowWidth = 0;
        List<Widget> currentRowItems = [];

        if (!hasRendered) {
          return Center(child: CircularProgressIndicator());
        }

        for (int i = 0; i < widget.children.length; i++) {
          double widgetWidth = _calculateWidth(widget.keysList[i]);

          if (currentRowWidth + widgetWidth > availableWidth * 0.95) {
            buttons.add(Row(
              children: currentRowItems,
              mainAxisAlignment: MainAxisAlignment.start,
            ));
            currentRowItems = [];
            currentRowWidth = 0;
          }

          currentRowItems.add(widget.newChildren[i]);
          currentRowWidth += widgetWidth;
        }

        if (currentRowItems.isNotEmpty) {
          buttons.add(Row(
            children: currentRowItems,
            mainAxisAlignment: MainAxisAlignment.start,
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
}
