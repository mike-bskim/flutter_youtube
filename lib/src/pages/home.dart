import 'package:flutter/material.dart';
import 'package:flutter_youtube/src/components/custom_appbar.dart';
import 'package:flutter_youtube/src/components/video_widget.dart';
import 'package:flutter_youtube/src/controller/home_controller.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => CustomScrollView(
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
                    child: VideoWidget(video : controller.youtubeResult.value.items![index]),
                  ),
                  onTap: () {
                    Get.toNamed('/detail/132');
                  },
                );
              },
//                childCount: controller.youtubeResult.value.items?.length ?? 0,
              childCount: controller.youtubeResult.value.items == null
                  ? 0
                  : controller.youtubeResult.value.items!.length,
            ))
          ],
        ),
      ),
    );
  }
}
