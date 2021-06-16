import 'package:flutter_youtube/src/models/youtube_video_result.dart';
import 'package:get/get.dart';

class YoutubeRepository extends GetConnect {
  static YoutubeRepository get to => Get.find();

  @override
  void onInit() {
    httpClient.baseUrl = 'https://www.googleapis.com';
    super.onInit();
  }
// error: The body might complete normally, causing 'null' to be returned, but the return type is a potentially non-nullable type. (body_might_complete_normally at [flutter_youtube] lib\src\repository\youtube_repository.dart:14)
  loadVideos() async { // 15:30초 // Future<YoutubeVideoResult>
    String url = '/youtube/v3/search?part=snippet&channelId=UCbMGBIayK26L4VaFrs5jyBw&maxResults=10&order=date&type=video&videoDefinition=high&key=AIzaSyAi2Rq_uTmtvsbmdJaOdkJlAB7dlQjvv9k';
    final resp = await get(url);

    if(resp.status.hasError) {
      return Future.error(resp.statusText!);
    }
    else {
      if (resp.body['items'] != null && resp.body['items'].length > 0){
        return YoutubeVideoResult.fromJson(resp.body);
      }
    }
  }
}