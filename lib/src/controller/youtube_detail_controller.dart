import 'package:flutter_youtube/src/controller/video_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeDetailController extends GetxController {
  VideoController? videoController;
  YoutubePlayerController? playController;

  @override
  void onInit() {
    videoController = Get.find(tag: Get.parameters['videoId']);
    playController = YoutubePlayerController(
      initialVideoId: Get.parameters['videoId']!,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    );
//    print(videoController!.video!.snippet!.title);
    super.onInit();
  }

  String get title => videoController!.video!.snippet!.title!;
  String get description => videoController!.video!.snippet!.description!;
  String get viewCount => '조회수 ${videoController!.statistics.value.viewCount!}회';
  String get likeCount => '${videoController!.statistics.value.likeCount!}';
  String get disLikeCount => '${videoController!.statistics.value.dislikeCount!}';
  String get publishedTime => DateFormat('yyyy-MM-dd').format(videoController!.video!.snippet!.publishTime!);

  String get youtuberThumbmailUrl => videoController!.youtuberThumbnailUrl;
  String get youtuberName => videoController!.youtuber.value.snippet!.title!;

}