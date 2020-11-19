import 'package:community_media_3/files/files.dart';
import 'package:community_media_3/pictures/pictures.dart';
import 'package:community_media_3/videos/videos.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:simple_di/simple_di.dart';
import 'package:ukuya_community_api_client/ukuya_community_api_client.dart';

import 'di.dart';

class AppState with ChangeNotifier {
  String _dataUrl = "https://api.ukuya.net/v1/media?community_id=1";

  AppState();

  // final _media = getService<CommunityApiClient>();

  String _jsonResponse = "";
  bool _isFetching = false;
  // GetMediaListResponse media;

  List _individualProfileMediaList;
  List get individualProfileMediaList => _individualProfileMediaList;

  bool get isFetching => _isFetching;

  // All Media
  Widget buildTile(int index, String type) {
    if ('image' == type) {
      print('$type , $index');
      return PictureCarousel(index: index);
    } else if ('video' == type) {
      print('$type , $index');
      return VideoCarousel(index: index);
    } else if ('doc' == type) {
      print('$type , $index');
      return FileCarousel(index: index);
    }
    return Container();
  }

  // File
  // List getFileList() {
  //   bool present = false;
  //   List<int> listFile = [];
  //   List<String> file = [];
  //   for (var i = 0; i < media.media.length; i++) {
  //     if ('doc' == media.media[i].mediaType) {
  //       present = true;
  //       listFile.add(i);
  //       file.add(media.media[i].mediaType);
  //     }
  //   }
  //   if (present == true) {
  //     print(
  //         'doc is present at $listFile, file type $file which is ${file.length} item');
  //   } else
  //     print('not present');
  //   return listFile;
  // }

  List getFileList() {
    bool present = false;
    List<int> listFile = [];
    List<String> file = [];
    for (var i = 0; i < getResponseJson().length; i++) {
      if ('doc' == getResponseJson()[i]['type']) {
        present = true;
        listFile.add(i);
        file.add(getResponseJson()[i]['type']);
      }
    }
    if (present == true) {
      print(
          'doc is present at $listFile, file type $file which is ${file.length} item');
    } else
      print('not present');
    return listFile;
  }

  // Picture
  List getPictureList() {
    bool present = false;
    List<int> listPicture = [];
    List<String> picture = [];
    for (var i = 0; i < getResponseJson().length; i++) {
      if ('image' == getResponseJson()[i]['type']) {
        present = true;
        listPicture.add(i);
        picture.add(getResponseJson()[i]['type']);
      }
    }
    if (present == true) {
      print(
          'image is present at $listPicture, media type $picture which is ${picture.length} item');
    } else
      print('not present');
    return listPicture;
  }

  // List getPictureList() {
  //   bool present = false;
  //   List<int> listPicture = [];
  //   List<String> picture = [];
  //   for (var i = 0; i < media.media.length; i++) {
  //     if ('image' == media.media[i].mediaType) {
  //       present = true;
  //       listPicture.add(i);
  //       picture.add(media.media[i].mediaType);
  //     }
  //   }
  //   if (present == true) {
  //     print(
  //         'image is present at $listPicture, media type $picture which is ${picture.length} item');
  //   } else
  //     print('not present');
  //   return listPicture;
  // }

  // Video
  List getVideoList() {
    bool present = false;
    List<int> listVideo = [];
    List<String> video = [];
    for (var i = 0; i < getResponseJson().length; i++) {
      if ('video' == getResponseJson()[i]['type']) {
        present = true;
        listVideo.add(i);
        video.add(getResponseJson()[i]['type']);
      }
    }
    if (present == true) {
      print(
          'video is present at $listVideo, media type $video which is ${video.length} item');
    } else
      print('not present');
    return listVideo;
  }
  // List getVideoList() {
  //   bool present = false;
  //   List<int> listVideo = [];
  //   List<String> video = [];
  //   for (var i = 0; i < media.media.length; i++) {
  //     if ('video' == media.media[i].mediaType) {
  //       present = true;
  //       listVideo.add(i);
  //       video.add(media.media[i].mediaType);
  //     }
  //   }
  //   if (present == true) {
  //     print(
  //         'video is present at $listVideo, media type $video which is ${video.length} item');
  //   } else
  //     print('not present');
  //   return listVideo;
  // }

  Future<void> fetchData() async {
    _isFetching = true;
    notifyListeners();

    var response = await http.get(_dataUrl);
    if (response.statusCode == 200) {
      _jsonResponse = response.body;
    }

    _isFetching = false;
    notifyListeners();
  }

  Future<void> getMedia() async {
    try {
      notifyListeners();
      final account = CommunityApiClient(
        baseUrl: 'https://api.ukuya.net',
      );

      final response = await account.getMediaList(
        request: GetMediaListRequest(
          communityId: 1,
        ),
      );

      if (response.hasError) {
        return response.error;
      }

      _individualProfileMediaList = response.response.media;
      print('mediatest' + _individualProfileMediaList.toString());
      return null;
    } finally {
      notifyListeners();
      return null;
    }
  }

  String get getResponseText => _jsonResponse;

  List<dynamic> getResponseJson() {
    if (_jsonResponse.isNotEmpty) {
      Map<String, dynamic> json = jsonDecode(_jsonResponse);
      return json['data'];
    }
    return null;
  }
}
