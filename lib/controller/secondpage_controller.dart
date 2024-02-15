import 'dart:convert';
import 'package:books/modal/secondpage_modal.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ControllerSecondPage extends GetxController {
  final Rx<News> _news = News().obs;
  News get news => _news.value;
  RxBool isBusy = false.obs;

  @override
  void onInit() {
    super.onInit();
    init();
  }

  init() async {
    await fetchNews();
  }

  fetchNews() async {
    isBusy.value = true;

    var response = await http.get(
      headers: {
        'authorization': "apikey 5zlg2SDxM6dWqrOzUBxNuK:19DK7hZbV8Fb3xluyT9joY",
        'content-type': 'application/json',
      },
      Uri.parse(
          'https://api.collectapi.com/news/getNews?country=tr&tag=general'),
    );
    if (response.statusCode == 200) {
      var parsed = json.decode(response.body);
      _news.value = News.fromJson(parsed);
    }

    isBusy.value = false;
  }
}
