import 'package:flutter/material.dart';

class Grid extends StatelessWidget {
  final int generate;
  final Widget child;
  // final IndexWidget index;
  final int index;

  Grid({this.generate, this.child, this.index});

  Function(int index) => child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GridView.count(
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 3,
        children: List.generate(generate, (index) => child),
      ),
    );
  }
}
