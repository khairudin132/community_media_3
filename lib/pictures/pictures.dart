import 'package:community_media_3/component/date_time.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app_state.dart';

class Pictures extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: appState.isFetching
          ? Center(child: CircularProgressIndicator())
          : appState.getResponseJson() != null
              ? GridView.count(
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 3,
                  children: List.generate(
                    appState.getPictureList().length,
                    (index) => PictureCarousel(
                      index: appState.getPictureList()[index],
                    ),
                  ),
                )
              : Container(),
    );
  }
}

class PictureCarousel extends StatelessWidget {
  final int index;

  PictureCarousel({this.index});

  // final weekAgo = DateTime.now().subtract(Duration(days: ));

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    return GestureDetector(
      onTap: () {},
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            border: Border.all(width: 1, color: Color(0xFFCCCCCC))),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child:
                  // CachedNetworkImage(
                  //   imageUrl: appState.getResponseJson()[index]['url'],
                  //   imageBuilder: (context, provider) {
                  //     return Container(
                  //       decoration: BoxDecoration(
                  //         image: DecorationImage(
                  //           image: provider,
                  //           fit: BoxFit.cover,
                  //         ),
                  //       ),
                  //     );
                  //   },
                  // )
                  Image.network(
                appState.getResponseJson()[index]['url'],
                // appState.media.media[index].url,
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            Container(
              height: 35,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(6),
                    bottomRight: Radius.circular(6)),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment(0, -0.95),
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
              child: Text(
                  convertUnixTimeStamp(
                      appState.getResponseJson()[index]['created_at']),
                  // appState.getResponseJson()[index]['created_at'].toString(),
                  // appState.media.media[index].createdAt.toString(),
                  style: TextStyle(
                      fontSize: 8,
                      fontWeight: FontWeight.normal,
                      color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
