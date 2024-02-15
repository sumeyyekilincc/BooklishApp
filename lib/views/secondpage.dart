import 'package:books/controller/secondpage_controller.dart';
import 'package:books/resources/r.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final ControllerSecondPage controllerNewsPage = Get.put(
    ControllerSecondPage(),
  );
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: const Text(
            "News",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              color: Colors.black,
            ),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(6),
          decoration: const BoxDecoration(color: Colors.grey),
          child: controllerNewsPage.isBusy.value == true
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: controllerNewsPage.news.result?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      child: Card(
                        color: Colors.grey.shade300,
                        shadowColor: Colors.black,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: SizedBox(
                                height: 150,
                                width: 115,
                                child: Image.network(
                                  controllerNewsPage
                                          .news.result?[index].image ??
                                      R.drawable.img1.noimage,
                                  fit: BoxFit.fill,
                                  errorBuilder: (context, error, stackTrace) {
                                    return SizedBox(
                                      height: 100,
                                      width: 100,
                                      child: Image.asset(
                                        R.drawable.img1.noimage,
                                        fit: BoxFit.fill,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 260,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controllerNewsPage
                                            .news.result?[index].name ??
                                        "--",
                                    maxLines: 4,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 13,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                  Text(
                                    controllerNewsPage
                                            .news.result?[index].description ??
                                        "--",
                                    maxLines: 3,
                                    style: const TextStyle(
                                      color: Colors.black54,
                                      fontSize: 12,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
