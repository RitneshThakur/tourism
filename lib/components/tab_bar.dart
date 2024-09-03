

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:pathika/pages/discover.dart';
import 'package:pathika/pages/map.dart';

import '../pages/home_page.dart';
import '../pages/profile.dart';
import '../pages/settings.dart';

class BottomNav extends StatelessWidget {
  final NavControllers controllers = Get.put(NavControllers());

  BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
          bottomNavigationBar: CurvedNavigationBar(
              height: 60,
              color: Colors.black,
              buttonBackgroundColor: Colors.black,
              backgroundColor: Colors.grey.shade100,
              animationCurve: Curves.easeInOutCubicEmphasized,
              items: const [
                Icon(
                  Icons.home,
                  size: 30,
                  color: Colors.white,
                ),
                Icon(
                  Iconsax.discover_1_outline,
                  size: 30,
                  color: Colors.white,
                ),
                Icon(
                  Bootstrap.map,
                  size: 30,
                  color: Colors.white,
                ),
                Icon(
                  Bootstrap.person,
                  size: 30,
                  color: Colors.white,
                )
              ],
              onTap: (cIndex) => controllers.ontap(cIndex)),
          body: controllers.pages[controllers.index.value]);
    });
  }
}

class NavControllers extends GetxController {
  var pages = [HomePage(),DiscoverPage(),MapPage(),ProfilePage()];
  Rx<int> index = 0.obs;

  ontap(int cIndex) {
    index.value = cIndex;
  }
}
