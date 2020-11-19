// import 'package:flutter/foundation.dart';
// import 'package:ukuya_api_models/ukuya_api_models.dart';
// import 'package:ukuya_community_api_client/ukuya_community_api_client.dart';
// import 'dart:async';
// import 'dart:convert';
//
// import 'package:http/http.dart' as http;
//
// import '../di.dart';
//
// // ignore: prefer_mixin
// class MediaState with ChangeNotifier {
//   MediaState();
//   // ------------------------------- FIELDS -------------------------------
//   final _media = getService<CommunityApiClient>();
//
//   bool isImages = false;
//   bool isVideos = false;
//   bool isFiles = false;
//   bool isAllMedia = false;
//   GetMediaListResponse mediaData;
//   CommunityMediaType _mediaType;
//   // Set<int> selectedApplications;
//
//   // ------------------------------- METHODS ------------------------------
//
//   Future<ErrorMessage> getMedia() async {
//     isAllMedia = true;
//     notifyListeners();
//
//     final response =
//         await http.get('https://api.ukuya.net/v1/media?community_id=1');
//     return json.decode(response.body);
//   }
//
//   Future<ErrorMessage> getAllMedia() async {
//     try {
//       isAllMedia = true;
//       notifyListeners();
//
//       final r = await _media.getMediaList(
//         request: GetMediaListRequest(
//           communityId: 1,
//         ),
//       );
//
//       if (r.hasError) {
//         return r.error;
//       }
//     } finally {
//       notifyListeners();
//     }
//
//     return null;
//   }
//
//   Future<ErrorMessage> getImages() async {
//     try {
//       isImages = true;
//       notifyListeners();
//
//       final r = await _media.getMediaList(
//           request: GetMediaListRequest(communityId: 1));
//
//       if (r.hasError) {
//         return r.error;
//       }
//     } finally {
//       isImages = false;
//       notifyListeners();
//     }
//
//     return null;
//   }
//
//   Future<ErrorMessage> getFiles() async {
//     try {
//       isFiles = true;
//       notifyListeners();
//
//       final r = await _media.getMediaList(
//           request: GetMediaListRequest(
//               communityId: 1, type: _mediaType.stringValue));
//
//       if (r.hasError) {
//         return r.error;
//       }
//     } finally {
//       isImages = false;
//       notifyListeners();
//     }
//
//     return null;
//   }
//
//   Future<ErrorMessage> getVideos() async {
//     try {
//       isFiles = true;
//       notifyListeners();
//
//       final r = await _media.getMediaList(
//           request: GetMediaListRequest(
//               communityId: 1, type: _mediaType.stringValue));
//
//       if (r.hasError) {
//         return r.error;
//       }
//     } finally {
//       isImages = false;
//       notifyListeners();
//     }
//
//     return null;
//   }
// }
