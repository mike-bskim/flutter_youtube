import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_youtube/src/controller/video_controller.dart';
import 'package:flutter_youtube/src/models/video.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class VideoWidget extends StatefulWidget {
  final Video video;

  const VideoWidget({Key? key, required this.video}) : super(key: key);

  @override
  _VideoWidgetState createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  VideoController? _videoController;

  @override
  void initState() {
//    print('video_widget >> initState');
    _videoController = Get.put(VideoController(video: widget.video), tag: widget.video.id!.videoId);
    super.initState();
  }

  Widget _thumbnail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
//      height: 250,
          color: Colors.grey.withOpacity(0.5),
          child: CachedNetworkImage(
            imageUrl: widget.video.snippet!.thumbnails!.medium!.url!,
            placeholder: (context, url) => Container(
              height: 200,
              child: Center(child: CircularProgressIndicator()),
            ),
            fit: BoxFit.fitWidth,
          ),
//          child: Image.network(
//            widget.video.snippet!.thumbnails!.medium!.url!,
//            fit: BoxFit.fitWidth,
//          ),
        ),
      ],
    );
  }

  Widget _simpleDetailInfo() {
    return Container(
//      color: Colors.pinkAccent,
      padding: const EdgeInsets.only(
        left: 10,
      ),
      child: Row(
        children: [
          Obx(
            () => CircleAvatar(
              radius: 30,
              backgroundColor: Colors.grey.withOpacity(0.9),
              backgroundImage: //Image.asset('assets/images/avatar.jpg').image,
                  Image.network(_videoController!.youtuberThumbnailUrl).image,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
//                color: Colors.grey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: Text(
                      widget.video.snippet!.title!,
                      maxLines: 2,
                    )),
                    IconButton(
                      alignment: Alignment.topCenter,
                      icon: Icon(Icons.more_vert, size: 18),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
              Container(
//                color: Colors.blue,
                child: Row(
                  children: [
                    Text(
                      widget.video.snippet!.channelTitle!,
                      style: TextStyle(fontSize: 14, color: Colors.black.withOpacity(0.8)),
                    ),
                    Text(' / '),
                    Obx(
                      () => Text(
                        _videoController!.viewCountString,
//                      '조회수 ${_videoController!.statistics.value.viewCount} 회',
                        style: TextStyle(fontSize: 12, color: Colors.black.withOpacity(0.6)),
                      ),
                    ),
                    Text(' / '),
                    Text(
                      DateFormat('yyyy-MM-dd').format(widget.video.snippet!.publishTime!),
                      style: TextStyle(fontSize: 12, color: Colors.black.withOpacity(0.8)),
                    ),
                  ],
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
//    print('video_widget >> build');
    return Container(
      child: Column(
        children: [
          _thumbnail(),
          _simpleDetailInfo(),
        ],
      ),
    );
  }
}
