import 'package:flutter/material.dart';
import 'package:flutter_youtube/src/models/youtube_video_result.dart';
import 'package:flutter_youtube/src/repository/youtube_repository.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class YoutubeSearchController extends GetxController {

  String key = 'SearchKey';
  RxList<String> history = RxList<String>.empty(growable: true);
  SharedPreferences? _profs;
  ScrollController scrollController = ScrollController();
  String? _currentKeyword;
  Rx<YoutubeVideoResult> youtubeVideoResult = YoutubeVideoResult(items: []).obs;

  @override
  void onInit() async {
    _event();
    _profs = await SharedPreferences.getInstance();
    List<dynamic> initData = (_profs!.get(key) as List<dynamic>);
    history(initData.map<String>((_) => _.toString()).toList());
    super.onInit();
  }

  void _event() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent &&
          youtubeVideoResult.value.nextPageToken != "") {
        _searchYoutube(_currentKeyword!);
      }
    });
  }

  void submitSearch(String searchKey) {
    history.addIf(!history.contains(searchKey), searchKey);
    _profs!.setStringList(key, history);
    _currentKeyword = searchKey;
    _searchYoutube(searchKey);
  }

  void _searchYoutube(String searchKey) async {
    YoutubeVideoResult? youtubeVideoResultFromServer = await YoutubeRepository.to
        .search(searchKey, youtubeVideoResult.value.nextPageToken ?? "");
//    print(youtubeVideoResultFromServer!.items!.length);

    if (youtubeVideoResultFromServer != null &&
        youtubeVideoResultFromServer.items != null &&
        youtubeVideoResultFromServer.items!.length > 0) {
      youtubeVideoResult.update((youtube) {
        youtube!.nextPageToken = youtubeVideoResultFromServer.nextPageToken;
        youtube.items!.addAll(youtubeVideoResultFromServer.items!);
      });
    }
  }

  void historyDelete() {
    _profs!.clear();  // 메모리 삭제
    history.clear(); // 화면 삭제
  }
}