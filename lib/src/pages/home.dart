import 'package:flutter/material.dart';
import 'package:flutter_youtube/src/components/custom_appbar.dart';
import 'package:flutter_youtube/src/components/video_widget.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: CustomAppBar(),
            floating: true,
            snap: true,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: VideoWidget(),
                  ),
                  onTap: () {
                    Get.toNamed('/detail/132');
                  },
                );
              },
              childCount: 10,
            )
          )
        ],
      ),
    );
  }
}
