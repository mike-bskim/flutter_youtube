import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_youtube/src/controller/app_controller.dart';
import 'package:flutter_youtube/src/pages/explore.dart';
import 'package:flutter_youtube/src/pages/home.dart';
import 'package:flutter_youtube/src/pages/library.dart';
import 'package:flutter_youtube/src/pages/subscribe.dart';
import 'package:get/get.dart';


// class App extends StatelessWidget {
class App extends GetView<AppController> {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: missing_return
      body: Obx(() {
        switch(RouteName.values[controller.currentIndex.value]){
          case RouteName.Home:
            return Home();
//            break;
          case RouteName.Explore:
            return Explore();
//            break;
          case RouteName.Subscribe:
            return Subscribe();
//            break;
          case RouteName.Library:
            return Library();
//            break;
          case RouteName.Add: // 7:10 근처.
            return Container();
//            break;
        }
      }),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.currentIndex.value,
          showSelectedLabels: true,
          selectedItemColor: Colors.black,
          onTap: (index) {
//            print(index);
            controller.changePageIndex(index);
          },
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/svg/icons/home_off.svg'),
              activeIcon: SvgPicture.asset('assets/svg/icons/home_on.svg'),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/svg/icons/compass_off.svg',
                width: 22.0,
              ),
              activeIcon: SvgPicture.asset(
                'assets/svg/icons/compass_on.svg',
                width: 22.0,
              ),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: SvgPicture.asset(
                  'assets/svg/icons/plus.svg',
                  width: 35.0,
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/svg/icons/subs_off.svg'),
              activeIcon: SvgPicture.asset('assets/svg/icons/subs_on.svg'),
              label: 'Subscribe',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/svg/icons/library_off.svg'),
              activeIcon: SvgPicture.asset('assets/svg/icons/library_on.svg'),
              label: 'Favorite',
            ),
          ],
        ),
      ),
    );
  }
}
