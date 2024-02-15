import 'package:books/controller/mobile_controller.dart';
import 'package:books/views/firstpage.dart';
import 'package:books/views/secondpage.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MobileDashboard extends StatefulWidget {
  const MobileDashboard({
    Key? key,
  }) : super(key: key);

  @override
  State<MobileDashboard> createState() => _MobileDashboardState();
}

class _MobileDashboardState extends State<MobileDashboard> {
  ControllerMobile c = Get.put(ControllerMobile());

  final List<Widget> _widgetOptions = <Widget>[];

  @override
  void initState() {
    super.initState();
    _widgetOptions.addAll([
      const FirstPage(),
      const SecondPage(),
    ]);
  }

  double width = Get.width;
  double height = Get.height;

  void onItemTapped(int index) {
    c.selectedIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: Stack(
          children: [
            Center(
              child: _widgetOptions.elementAt(c.selectedIndex.value),
            )
          ],
        ),
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.grey,
          index: c.selectedIndex.value,
          items: [
            buildBottomNavItem(
              icon: const Icon(
                Icons.menu_book_sharp,
                size: 30,
              ),
              index: 0,
            ),
            buildBottomNavItem(
              icon: const Icon(
                Icons.newspaper,
                size: 30,
              ),
              index: 1,
            ),
          ],
        ),
      ),
    );
  }

  buildBottomNavItem({icon, int? index}) {
    final bool isSelected = c.selectedIndex.value == index;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: icon,
          color: isSelected ? Colors.black : Colors.grey,
          onPressed: () => onItemTapped(index ?? 0),
        ),
      ],
    );
  }
}
