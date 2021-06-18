import 'package:flutter/cupertino.dart';
import 'package:flutter_youtube/src/models/youtube_video_result.dart';
import 'package:flutter_youtube/src/repository/youtube_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  Rx<YoutubeVideoResult> youtubeResult = YoutubeVideoResult(items: []).obs; // items: []
  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    _videoLoad();
    _event();
    super.onInit();
  }

  void _event() {
    scrollController.addListener(() {
//      print('position(${scrollController.position.pixels.toInt()}) / ' +
//          'Max position(${scrollController.position.maxScrollExtent.toInt()})');
      if (scrollController.position.pixels.toInt() ==
          scrollController.position.maxScrollExtent.toInt() &&
          youtubeResult.value.nextPageToken != '') {
        _videoLoad();
      }
    });
  }

  // [ERROR:flutter/lib/ui/ui_dart_state.cc(199)] Unhandled Exception: Forbidden
  void _videoLoad() async {
    YoutubeVideoResult? youtubeVideoResult =
        await YoutubeRepository.to.loadVideos(youtubeResult.value.nextPageToken ?? '');

    if (youtubeVideoResult != null &&
        youtubeVideoResult.items != null &&
        youtubeVideoResult.items!.length > 0) {
      youtubeResult.update((youtube) {
        youtube!.nextPageToken = youtubeVideoResult.nextPageToken; // #11 17:40
        youtube.items!.addAll(youtubeVideoResult.items!);
      });
//      youtubeResult(youtubeVideoResult);
    }
  }
}
