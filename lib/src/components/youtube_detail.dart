import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_youtube/src/controller/youtube_detail_controller.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeDetail extends GetView<YoutubeDetailController> {
  // with 'Get.lazyPut()' in main.dart
  Widget _titleZone() {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              controller.title,
              style: TextStyle(fontSize: 15),
            ),
            Row(
              children: [
                Text(
                  controller.viewCount,
                  style: TextStyle(fontSize: 13, color: Colors.black.withOpacity(0.6)),
                ),
                Text(' / '),
                Text(
                  controller.publishedTime,
                  style: TextStyle(fontSize: 13, color: Colors.black.withOpacity(0.8)),
                ),
              ],
            )
          ],
        ));
  }

  Widget _descriptionZone() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Text(controller.description, style: TextStyle(fontSize: 14)),
    );
  }

  Widget _buttonOne({required String msg, required String icon}) {
    return Column(
      children: [
        SvgPicture.asset('assets/svg/icons/$icon.svg'), Text(msg),
//        IconButton(onPressed: Get.back, icon: Icon(Icons.close)),
      ],

    );
  }

  Widget _buttonZone() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buttonOne(icon: 'like', msg: controller.likeCount),
        _buttonOne(icon: 'dislike', msg: controller.disLikeCount),
        _buttonOne(icon: 'share', msg: '공유'),
        _buttonOne(icon: 'save', msg: '저장'),
      ],
    );
  }
// IconButton(onPressed: Get.back, icon: Icon(Icons.close))
  Widget get oneLine => Container(
        height: 1,
        color: Colors.black.withOpacity(0.2),
      );

  Widget _ownerZone() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.grey.withOpacity(0.9),
            backgroundImage:
                //Image.asset('assets/images/avatar.jpg').image,
                Image.network(controller.youtuberThumbmailUrl).image,
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  controller.youtuberName,
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  '구독자 ${controller.videoController!.youtuber.value.statistics!.subscriberCount}',
                  style: TextStyle(fontSize: 14, color: Colors.black.withOpacity(0.6)),
                ),
              ],
            ),
          ),
          GestureDetector(
            child: Text(
              '구독',
              style: TextStyle(fontSize: 16, color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  Widget _description() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _titleZone(),
          oneLine,
          _descriptionZone(),
          _buttonZone(),
          SizedBox(
            height: 20,
          ),
          oneLine,
          _ownerZone(),
          oneLine,
          IconButton(onPressed: Get.back, icon: Icon(Icons.close))
        ],
      ),
    );
  }

  // IconButton(onPressed: Get.back, icon: Icon(Icons.close))
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(),
      body: Column(
        children: [
          YoutubePlayer(
            controller: controller.playController!,
            showVideoProgressIndicator: true,
            progressIndicatorColor: Colors.blueAccent,
            topActions: <Widget>[
              const SizedBox(width: 8.0),
              Expanded(
                child: Text(
                  controller.playController!.metadata.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.settings,
                  color: Colors.white,
                  size: 25.0,
                ),
                onPressed: () {
                },
              ),
            ],
            onReady: () {
            },
            onEnded: (data) {
            },
          ),
          Expanded(
            child: _description(),
          )
        ],
      ),
    );
  }
}
