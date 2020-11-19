import 'dart:ui';

import 'package:community_media_3/pictures/pictures.dart';
import 'package:community_media_3/videos/videos.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'all_media/all_media.dart';
import 'app_state.dart';
import 'files/files.dart';

class NavigationItem {
  String title;

  NavigationItem(this.title);
}

List<NavigationItem> getNavigationItemList() {
  return <NavigationItem>[
    NavigationItem("All Media"),
    NavigationItem("Pictures"),
    NavigationItem("Videos"),
    NavigationItem("Files"),
  ];
}

class TabNavigation extends StatefulWidget {
  final AppState state;
  TabNavigation({this.state});

  @override
  State createState() => _TabNavigationState();
}

class _TabNavigationState extends State<TabNavigation> {
  List<NavigationItem> navigationItems = getNavigationItemList();
  NavigationItem selectedItem;

  Widget currentWidgetView;

  // @override
  // void initState() {
  //   super.initState();
  //   widget.state.fetchData();
  //   setState(() {
  //     selectedItem = navigationItems[0];
  //     currentWidgetView = AllMedia();
  //   });
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   _initChannel(widget.state);
  // }
  //
  // _initChannel(AppState state) async {
  //   await state.fetchData();
  //   setState(() {
  //     selectedItem = navigationItems[0];
  //     currentWidgetView = AllMedia();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final _state = Provider.of<AppState>(context);
    return SafeArea(
      child: Scaffold(
          body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: RichText(
              text: TextSpan(
                  text: 'COMMUNITY\n',
                  style: TextStyle(
                      fontSize: 36,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w300,
                      color: Color(0xFF646363)),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'MEDIA',
                      style: TextStyle(fontWeight: FontWeight.w900),
                    ),
                  ]),
            ),
          ),
          SizedBox(height: 60),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: buildNavigationItems(_state),
          ),
          SizedBox(height: 25),
          Expanded(
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              child: currentWidgetView,
            ),
          ),
          SizedBox(height: 40),
        ],
      )),
    );
  }

  buildNavigationItems(AppState state) {
    List<Widget> list = [];
    for (var navigationItem in navigationItems) {
      list.add(buildNavigationItem(navigationItem, state));
    }
    return list;
  }

  Widget buildNavigationItem(NavigationItem item, AppState state) {
    return GestureDetector(
      onTap: () {
        state.fetchData();
        setState(() {
          switch (item.title) {
            case "All Media":
              currentWidgetView = AllMedia();
              break;
            case "Pictures":
              currentWidgetView = Pictures();
              break;
            case "Videos":
              currentWidgetView = Videos();
              break;
            case "Files":
              currentWidgetView = Files();
              break;
          }
        });
        selectedItem = item;
      },
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 300),
        opacity: selectedItem == item ? 1.0 : 0.3,
        child: Text(
          item.title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
