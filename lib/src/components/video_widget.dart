import 'package:flutter/material.dart';

class VideoWidget extends StatelessWidget {
  Widget _thumbnail() {
    return Container(
      height: 250,
      color: Colors.grey.withOpacity(0.5),
    );
  }

  Widget _simpleDetailInfo() {
    return Container(
//      color: Colors.pinkAccent,
      padding: const EdgeInsets.only(left: 10,),
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
                    Expanded(child: Text('개남 유투브 다시 보기개남 유투브 다시 보기개남 유투브 다시 보기', maxLines: 2 ,)),
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
                      '홍이장군',
                      style: TextStyle(
                          fontSize: 14, color: Colors.black.withOpacity(0.8)
                      ),
                    ),
                    Text(' / '),
                    Text(
                      '조회수 1000회',
                      style: TextStyle(
                          fontSize: 12, color: Colors.black.withOpacity(0.6)
                      ),
                    ),
                    Text(' / '),
                    Text(
                      '2021-06-16',
                      style: TextStyle(
                          fontSize: 12, color: Colors.black.withOpacity(0.8)
                      ),
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
