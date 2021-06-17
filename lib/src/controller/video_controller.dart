import 'package:flutter_youtube/src/models/statistics.dart';
import 'package:flutter_youtube/src/models/video.dart';
import 'package:flutter_youtube/src/repository/youtube_repository.dart';
import 'package:get/get.dart';

class VideoController extends GetxController {
  Video? video;
  VideoController({this.video});
  Rx<Statistics> statistics = Statistics().obs;

  @override
  void onInit() async {
    Statistics? loadStatistics = await YoutubeRepository.to.getVideoInfoById(video!.id!.videoId!);
    statistics(loadStatistics);
    super.onInit();
  }

  String get viewCountString => '조회수 ${statistics.value.viewCount?? '-'}회';
}