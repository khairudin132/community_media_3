import 'dart:convert';

import 'package:community_media_3/component/date_time.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:http/http.dart' as http;

import '../app_state.dart';

class Videos extends StatelessWidget {
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
                    appState.getVideoList().length,
                    (index) => VideoCarousel(
                      index: appState.getVideoList()[index],
                      state: appState,
                    ),
                  ),
                )
              : Container(),
    );
  }
}

class VideoCarousel extends StatefulWidget {
  final int index;
  final AppState state;

  final String id;
  VideoCarousel({this.index, this.id, this.state});

  @override
  _VideoCarouselState createState() => _VideoCarouselState();
}

class _VideoCarouselState extends State<VideoCarousel> {
  findVideoDuration(String url) {
    VideoPlayerController _controller = VideoPlayerController.network(url)
      ..initialize().then((value) => {});
    Duration duration = _controller.value.duration;
    return duration;
  }

  format(Duration d) => d.toString().split('.').first.padLeft(8, "0");

  // format(Duration d) => d.toString().substring(2, 8);

  String findVideoId(String url) {
    String videoId = url.substring(url.length - 11);
    return 'https://img.youtube.com/vi/$videoId/0.jpg';
  }

  Future<dynamic> getDetail(String userUrl) async {
    String embedUrl = "https://www.youtube.com/oembed?url=$userUrl&format=json";

    //store http request response to res variable
    var res = await http.get(embedUrl);
    print("get youtube detail status code: " + res.statusCode.toString());

    try {
      if (res.statusCode == 200) {
        //return the json from the response
        return json.decode(res.body);
      } else {
        //return null if status code other than 200
        return null;
      }
    } on FormatException catch (e) {
      print('invalid JSON' + e.toString());
      //return null if error
      return null;
    }
  }

  Future<String> duration() async {
    String videoUrl = 'https://www.youtube.com/watch?v=d_m5csmrf7I';
    var jsonData = await getDetail(videoUrl);
    String title = jsonData['type'];
    return getDur = title;
  }

  String getDur = '';

  // @override
  // void initState() {
  //   super.initState();
  //   _controller = VideoPlayerController.network(
  //       widget.state.getResponseJson()[widget.index]['url'])
  //     ..initialize().then((_) {
  //       // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
  //       setState(() {});
  //     });
  // }

  // String findVideoDuration(String url) {
  //   String videoDuration =
  // }

  static String convertTime(String duration) {
    int indexH = duration.indexOf('H') ?? null;
    int indexM = duration.indexOf('M') ?? null;
    int indexS = duration.indexOf('S') ?? null;

    String hour = '';
    String min = '';
    String sec = '';

    if (indexH != -1) hour = duration.substring(2, indexH);
    if (indexM != -1)
      min = duration.substring(indexH != -1 ? indexH + 1 : 2, indexM);
    if (indexS != -1)
      sec = duration.substring(
          indexM != -1
              ? indexM + 1
              : indexH != -1
                  ? indexH + 1
                  : 2,
          indexS);

    String timeline = ' ';

    if (hour.length > 0) {
      if (hour.length == 1)
        timeline += '0' + hour + ':';
      else
        timeline += hour + ':';
    }
    if (min.length > 0) {
      if (min.length == 1)
        timeline += '0' + min + ':';
      else
        timeline += min + ':';
    }
    if (sec.length > 0) {
      if (timeline.length == 1) timeline += '00:';
      if (sec.length == 1)
        timeline += '0' + sec;
      else
        timeline += sec;
    } else {
      timeline += '00';
    }

    return timeline;
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Player(
                    url: appState.getResponseJson()[widget.index]['url'],
                    // url: appState.media.media[widget.index].url,
                  ))),
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
              child: Image.network(
                findVideoId(appState.getResponseJson()[widget.index]['url']),
                // findVideoId(appState.media.media[widget.index].url),
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
              left: 10,
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: Color(0xFFE16B5A),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[400],
                          ),
                        ]),
                    child:
                        Icon(Icons.play_arrow, color: Colors.white, size: 12),
                  ),
                  SizedBox(width: 5),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        // findVideoDuration(appState.getResponseJson()[widget.index]['url']).toString(),
                        getDur,
                        style: TextStyle(
                            fontFamily: 'AvenirNext',
                            fontSize: 10,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        // appState.getResponseJson()[widget.index]['created_at'].toString(),
                        convertUnixTimeStamp(appState
                            .getResponseJson()[widget.index]['created_at']),
                        // appState.media.media[widget.index].createdAt.toString(),
                        style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 6,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Player extends StatefulWidget {
  final String url;
  Player({this.url});
  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.url),
      flags: YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.black12,
      body: Center(
        child: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          liveUIColor: Colors.red,
          progressIndicatorColor: Colors.red,
          onReady: () {
            print('Player is ready.');
          },
        ),
      ),
    );
  }
}
