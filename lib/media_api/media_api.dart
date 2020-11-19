import 'dart:async';
import 'dart:convert';

import 'package:community_media_3/media_api/get_media_list.dart';
import 'package:http/http.dart' as http;

Future<GetMediaList> getMedia() async {
  final response =
      await http.get('https://api.ukuya.net/v1/media?community_id=1');
  return GetMediaList.fromJson(json.decode(response.body)['data']['type']);
}
