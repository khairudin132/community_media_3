import 'package:community_media_3/component/date_time.dart';
import 'file:///E:/Programming/community_media_3/lib/models/doc_format.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app_state.dart';

class Files extends StatelessWidget {
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
                    appState.getFileList().length,
                    (index) => FileCarousel(
                      index: appState.getFileList()[index],
                    ),
                  ),
                )
              : Container(),
    );
  }
}

class FileCarousel extends StatelessWidget {
  final int index;
  FileCarousel({this.index});

  final DocFormat myDoc = DocFormat();

  String findFileType(String file) {
    if (file.contains('.doc')) {
      return 'doc';
    } else if (file.contains('.xlsx')) {
      return 'xlsx';
    } else if (file.contains('.pdf')) {
      return 'pdf';
    } else if (file.contains('.pdf')) {
      return 'ppt';
    }
    return 'no file';
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    // final date = appState.getResponseJson()[index]['created_at'];
    // final relativeTime = date.relativeTimeString;
    // final dateString = date.dateFormattedString;

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
            Positioned(
              top: 20,
              child: Center(
                child: SizedBox(
                  width: 45,
                  height: 45,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      myDoc.icon(findFileType(
                          appState.getResponseJson()[index]['file_name'])),
                      // myDoc.icon(findFileType(appState.media.media[index].fileName)),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 10,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 100,
                    child: Text(
                      appState.getResponseJson()[index]['title'],
                      // appState.media.media[index].mediaTitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 8,
                          color: Color(0xFF333333),
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    convertUnixTimeStamp(
                        appState.getResponseJson()[index]['created_at']),
                    // convertUnixTimeStamp(appState.media.media[index]['created_at']),
                    style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 6,
                        color: Color(0xFF888888),
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
