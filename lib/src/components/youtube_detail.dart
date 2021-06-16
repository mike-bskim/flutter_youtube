import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
//import 'package:get/get.dart';

class YoutubeDetail extends StatelessWidget {
  Widget _titleZone() {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              '개발하는 남자 유튜브 영상 다시보기',
              style: TextStyle(fontSize: 15),
            ),
            Row(
              children: [
                Text(
                  '조회수 1000회',
                  style: TextStyle(fontSize: 13, color: Colors.black.withOpacity(0.6)),
                ),
                Text(' / '),
                Text(
                  '2021-06-16',
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
      child: Text('안녕하세요 개발하는 남자입니다', style: TextStyle(fontSize: 14)),
    );
  }

  Widget _buttonOne({required String msg, required String icon}) {
    return Column(
      children: [SvgPicture.asset('assets/svg/icons/$icon.svg'), Text(msg)],
    );
  }

  Widget _buttonZone() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buttonOne(icon: 'like', msg: '1000'),
        _buttonOne(icon: 'dislike', msg: '0'),
        _buttonOne(icon: 'share', msg: '공유'),
        _buttonOne(icon: 'save', msg: '저장'),
      ],
    );
  }

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
            backgroundImage: Image.asset('assets/images/avatar.jpg').image,
//          Image.network(
//                  'https://yt3.ggpht.com/ytc/AAUvwniU0ZOGv47lDdGSQ8H004fQgwOAJRlobuCvXwNl=s88-c-k-c0x00ffffff-no-rj')
//              .image,
          ),
          SizedBox(width: 15,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  '개발하는 남자',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  '구독자 20000',
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
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            height: 250,
            color: Colors.grey.withOpacity(0.5),
          ),
          Expanded(
            child: _description(),
          )
        ],
      ),
    );
  }
}
