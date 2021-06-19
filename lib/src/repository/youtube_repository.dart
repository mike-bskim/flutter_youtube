import 'package:flutter_youtube/src/models/statistics.dart';
import 'package:flutter_youtube/src/models/youtube_video_result.dart';
import 'package:flutter_youtube/src/models/youtuber.dart';
import 'package:get/get.dart';

class YoutubeRepository extends GetConnect {
  static YoutubeRepository get to => Get.find();

  @override
  void onInit() {
    httpClient.baseUrl = 'https://www.googleapis.com';
    super.onInit();
  }

// error: The body might complete normally, causing 'null' to be returned, but the return type is a potentially non-nullable type. (body_might_complete_normally at [flutter_youtube] lib\src\repository\youtube_repository.dart:14)
  Future<YoutubeVideoResult?> loadVideos(String nextPageToken) async {
    // 15:30초 // Future<YoutubeVideoResult>
    String url =
        '/youtube/v3/search?part=snippet&channelId=UCbMGBIayK26L4VaFrs5jyBw&maxResults=10&order=date&type=video&videoDefinition=high&key=AIzaSyAi2Rq_uTmtvsbmdJaOdkJlAB7dlQjvv9k&pageToken=$nextPageToken';
    final resp = await get(url);

    if (resp.status.hasError) {
      return Future.error(resp.statusText!);
    } else {
      if (resp.body['items'] != null && resp.body['items'].length > 0) {
        return YoutubeVideoResult.fromJson(resp.body);
      }
    }
  }

  Future<YoutubeVideoResult?> search(
      String searchKeyword, String nextPageToken) async {
    String url =
        '/youtube/v3/search?part=snippet&maxResults=10&order=date&type=video&videoDefinition=high&key=AIzaSyAi2Rq_uTmtvsbmdJaOdkJlAB7dlQjvv9k&pageToken=$nextPageToken&q=$searchKeyword';
    final resp = await get(url);

    if (resp.status.hasError) {
      return Future.error(resp.statusText!);
    } else {
      if (resp.body["items"] != null && resp.body["items"].length > 0) {
        return YoutubeVideoResult.fromJson(resp.body);
      }
    }
  }

  Future<Statistics?> getVideoInfoById(String videoId) async {
    String url =
        '/youtube/v3/videos?part=statistics&key=AIzaSyAi2Rq_uTmtvsbmdJaOdkJlAB7dlQjvv9k&id=$videoId';
    final resp = await get(url);

    if (resp.status.hasError) {
      return Future.error(resp.statusText!);
    } else {
      if (resp.body['items'] != null && resp.body['items'].length > 0) {
        Map<String, dynamic> data = resp.body["items"][0];
        return Statistics.fromJson(data["statistics"]);
      }
    }
  }

  Future<Youtuber?> getYoutuberInfoById(String channelId) async {
    String url =
        '/youtube/v3/channels?part=statistics,snippet&key=AIzaSyAi2Rq_uTmtvsbmdJaOdkJlAB7dlQjvv9k&id=$channelId';
    final resp = await get(url);

    if (resp.status.hasError) {
      return Future.error(resp.statusText!);
    } else {
      if (resp.body['items'] != null && resp.body['items'].length > 0) {
        Map<String, dynamic> data = resp.body["items"][0];
        return Youtuber.fromJson(data);
      }
    }
  }
}
