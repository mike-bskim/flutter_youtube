import 'package:flutter_youtube/src/models/statistics.dart';
import 'package:flutter_youtube/src/models/video.dart';
import 'package:flutter_youtube/src/models/youtuber.dart';
import 'package:flutter_youtube/src/repository/youtube_repository.dart';
import 'package:get/get.dart';

class VideoController extends GetxController {
  Video? video;
  VideoController({this.video});
  Rx<Statistics> statistics = Statistics().obs;
  Rx<Youtuber> youtuber = Youtuber().obs;

  @override
  void onInit() async {
    Statistics? loadStatistics = await YoutubeRepository.to.getVideoInfoById(video!.id!.videoId!);
    statistics(loadStatistics);
    Youtuber? loadYoutuber = await YoutubeRepository.to.getYoutuberInfoById(video!.snippet!.channelId!);
    youtuber(loadYoutuber);
    super.onInit();
  }

  String get viewCountString => '조회수 ${statistics.value.viewCount?? '-'}회';
  String get youtuberThumbnailUrl {
//    var nullImage = 'assets/images/avatar.jpg';
    var nullImage = 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/User_icon_2.svg/768px-User_icon_2.svg.png';
    if (youtuber.value.snippet == null) return nullImage;
    return youtuber.value.snippet!.thumbnails!.medium!.url!;
  }
}