import 'package:flutter/material.dart';
import 'package:flutter_youtube/src/models/video.dart';
import 'package:intl/intl.dart';

class VideoWidget extends StatelessWidget {
  final Video video;

  const VideoWidget({Key? key, required this.video}) : super(key: key);

  Widget _thumbnail() {
    return Container(
      height: 250,
      color: Colors.grey.withOpacity(0.5),
      child: Image.network(
        video.snippet!.thumbnails!.medium!.url!,
        fit: BoxFit.fitWidth,
      ),
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
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.grey.withOpacity(0.9),
            backgroundImage: Image.asset('assets/images/avatar.jpg').image,
//          Image.network(
//                  'https://yt3.ggpht.com/ytc/AAUvwniU0ZOGv47lDdGSQ8H004fQgwOAJRlobuCvXwNl=s88-c-k-c0x00ffffff-no-rj')
//              .image,
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
                        child: Text(video.snippet!.title!,
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
                    Text(video.snippet!.channelTitle!,
                      style: TextStyle(fontSize: 14, color: Colors.black.withOpacity(0.8)),
                    ),
                    Text(' / '),
                    Text(
                      '조회수 1000회',
                      style: TextStyle(fontSize: 12, color: Colors.black.withOpacity(0.6)),
                    ),
                    Text(' / '),
                    Text(DateFormat('yyyy-MM-dd').format(video.snippet!.publishTime!),
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
