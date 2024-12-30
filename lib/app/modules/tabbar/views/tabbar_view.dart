import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../account/views/account_view.dart';
import '../../home/views/home_view.dart';
import '../controllers/tabbar_controller.dart';

class TabbarView extends GetView<TabbarController> {
  TabbarView({super.key});
  var screen = [
    HomeView(),
    AccountView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: controller.bottomNavigationController.selectedIndex.value,
          children: screen,
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          backgroundColor: Colors.black,
          onTap: (index) {
            controller.bottomNavigationController.changeIndex(index);
          },
          currentIndex:
              controller.bottomNavigationController.selectedIndex.value,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                label: "Home",
                backgroundColor: Colors.black),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              label: "Account",
            ),
          ],
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          showSelectedLabels: true,
        ),
      ),
    );
  }
}
