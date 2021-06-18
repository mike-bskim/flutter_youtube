import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_youtube/src/controller/youtube_search_controller.dart';
import 'package:get/get.dart';

class YoutubeSearch extends GetView<YoutubeSearchController> {
  Widget _searchHistory() {
    return ListView(
      children: List.generate(10, (index) { //controller.history.length
        return ListTile(
//          onTap: () {
//            controller.submitSearch(controller.history[index]);
//          },
          leading: SvgPicture.asset(
            "assets/svg/icons/wall-clock.svg",
            width: 20,
          ),
          title: Padding(
            padding: const EdgeInsets.only(bottom: 3),
            child: Text('개발하는 남자 $index', //"${controller.history[index]}"
          )),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 15,
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset("assets/svg/icons/back.svg"),
          onPressed: () {
            Get.back();
          },
        ),
        title: TextField(
          onSubmitted: (key) {
//            controller.submitSearch(key);
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey.withOpacity(0.2),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      ),
      body: _searchHistory(),
//      body: Obx(
//        () => controller.youtubeVideoResult.value.items.length > 0
//            ? _searchResultView()
//            : _searchHistory(),
//      ),
    );
  }
}
