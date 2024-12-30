import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  RxBool isSearchVisible = false.obs;
  var currentIndex = 0.obs;
  final List<String> imgList = [
    "assets/tem/slider1.jpg",
    "assets/tem/slider2.jpg",
    "assets/tem/slider3.jpg"
  ];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
