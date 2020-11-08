import 'package:flutter/material.dart';

class Grid extends StatelessWidget {
  final Widget child;
  final int generate;
  Grid({this.child, this.generate});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GridView.count(
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 3,
        children: List.generate(generate, (index) {
          return child;
        }),
      ),
    );
  }
}
