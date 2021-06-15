import 'package:flutter/material.dart';
import 'package:flutter_youtube/src/app.dart';
import 'package:flutter_youtube/src/binding/init_binding.dart';
import 'package:flutter_youtube/src/components/youtube_detail.dart';
import 'package:get/get.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Youtube Clone App',
      theme: ThemeData(
        primaryColor: Colors.white,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
//      home: App(),
      initialBinding: InitBinding(),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => App(),),
        GetPage(name: '/detail/:videoId', page: () => YoutubeDetail(),),
      ],
    );
  }
}
