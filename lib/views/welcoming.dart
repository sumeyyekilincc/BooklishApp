import 'package:books/resources/r.dart';
import 'package:books/views/widgets/mobile_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Welcoming extends StatelessWidget {
  const Welcoming({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(R.drawable.img1.background1),
            fit: BoxFit.cover,
            opacity: 0.8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 120,
              width: 300,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(80),
                color: Colors.white38,
              ),
              child: TextButton(
                child: const Text(
                  "BOOKLISH",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 6),
                ),
                onPressed: () {
                  Get.to(() => const MobileDashboard());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
