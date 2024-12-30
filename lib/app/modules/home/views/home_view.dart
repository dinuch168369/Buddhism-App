import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => HomeController());
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/images/logo.png',
              fit: BoxFit.contain), // Replace with your logo
        ),
        centerTitle: false,
        title: Obx(() {
          // Use Obx to observe changes in controller's search visibility
          return controller.isSearchVisible.value
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Flexible(
                        child: TextField(
                          autofocus: true, // Automatically focus when visible
                          style: TextStyle(color: Colors.white), // Text color
                          decoration: InputDecoration(
                            hintText: "Search...",
                            hintStyle: TextStyle(color: Colors.white70),
                            border: InputBorder.none,
                            filled: false,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 8),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : SizedBox();
        }),
        actions: [
          IconButton(
            onPressed: () {
              // Toggle search visibility
              controller.isSearchVisible.value =
                  !controller.isSearchVisible.value;
            },
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            child: Stack(
              children: [
                Column(
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                        enableInfiniteScroll: true,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 1000 * 3),
                        // autoPlayCurve: Curves.fastOutSlowIn,
                        viewportFraction: 1,
                        onPageChanged: (index, reason) {
                          controller.currentIndex.value =
                              index; // Update the index
                        },
                      ),
                      items: controller.imgList
                          .map((item) => ClipRRect(
                                child: Image.asset(
                                  item,
                                  fit: BoxFit.cover,
                                  width: Get.width,
                                  height: Get.height,
                                ),
                              ))
                          .toList(),
                    ),
                  ],
                ),
                Container(
                  color: Colors.black38,
                  width: Get.width,
                  height: 233,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Find The Best online',
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.white70,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Course & Learn',
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.white70,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Text(
                            'Through a combination of lectors, reading and discussion, student will gain a solid foundation in education in educational psychology.',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white70,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Dot Slider (Indicators)
                Padding(
                  padding: const EdgeInsets.only(top: 200),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      controller.imgList.length,
                      (index) => Obx(() {
                        return AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          height: 10.0,
                          width: controller.currentIndex.value == index
                              ? 20.0
                              : 10.0,
                          decoration: BoxDecoration(
                            color: controller.currentIndex.value == index
                                ? Colors.white
                                : Colors.grey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
