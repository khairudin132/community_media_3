import 'dart:math';

import 'file:///E:/Programming/ukuya/community_media_2/lib/component/grid_view.dart';
import 'package:flutter/material.dart';

import '../flower_model.dart';

class Pictures extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Grid(child: _Carousel(), generate: 12);
  }
}

class _Carousel extends StatelessWidget {
  int _randomFlower() {
    int number = Random().nextInt(decorationFlower.length);
    return number;
  }

  // @required
  // final String title;
  //
  // _Carousel({this.title});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        GestureDetector(
          onTap: () {},
          child: ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.asset(
              decorationFlower[_randomFlower()].imageUrl,
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
          ),
        ),
        Container(
          height: 35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(6),
                bottomRight: Radius.circular(6)),
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment(0, -0.8),
              colors: [
                Colors.black.withOpacity(0.5),
                Colors.black.withOpacity(0)
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 14,
          child: Text('fsfsd',
              style: TextStyle(
                  fontSize: 8,
                  fontWeight: FontWeight.normal,
                  color: Colors.white)),
        ),
      ],
    );
  }
}
