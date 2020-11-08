import 'dart:ui';

import 'package:community_media_3/pictures/pictures.dart';
import 'package:community_media_3/videos/videos.dart';
import 'package:flutter/material.dart';

import 'all_media/all_media.dart';
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
  //   setState(() {
  //     selectedItem = navigationItems[0];
  //     currentWidgetView = AllMedia();
  //   });
  // }

  // List<Widget> _children = [
  //   AllMedia(),
  //   Pictures(),
  //   Videos(),
  //   Files(),
  // ];

  // final List<Widget> items = [
  //   Tab(
  //     text: "All Media",
  //   ),
  //   Tab(
  //     text: "Pictures",
  //   ),
  //   Tab(
  //     text: "Videos",
  //   ),
  //   Tab(
  //     text: "Files",
  //   )
  // ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: buildNavigationItems(),
          ),
          SizedBox(height: 20),
          Expanded(
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              child: currentWidgetView,
            ),
          ),
        ],
      )),
    );
  }

  List<Widget> buildNavigationItems() {
    List<Widget> list = [];
    for (var navigationItem in navigationItems) {
      list.add(buildNavigationItem(navigationItem));
    }
    return list;
  }

  Widget buildNavigationItem(NavigationItem item) {
    return GestureDetector(
      onTap: () {
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
          selectedItem = item;
        });
      },
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 300),
        opacity: selectedItem == item ? 1.0 : 0.3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              item.title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

// @override
// Widget build(BuildContext context) {
//   return DefaultTabController(
//     length: 4,
//     child: Scaffold(
//       body: TabBarView(
//         children: _children,
//       ),
//       bottomNavigationBar: TabBar(
//         labelStyle: TextStyle(fontWeight: FontWeight.w700),
//         indicatorSize: TabBarIndicatorSize.label,
//         labelColor: Color(0xff1967d2),
//         unselectedLabelColor: Color(0xff5f6368),
//         isScrollable: true,
//         indicator: MD2Indicator(
//           indicatorSize: MD2IndicatorSize.normal,
//           indicatorHeight: 3,
//           indicatorColor: Color(0xff1967d2),
//         ),
//         tabs: items,
//       ),
//     ),
//   );
// }

}
