import 'dart:convert';
import 'package:books/modal/firstpage_modal.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ControllerFirstPage extends GetxController {
  final Rx<NewBook> _newbook = NewBook().obs;
  NewBook? get newbook => _newbook.value;
  RxBool isBusy = false.obs;

  @override
  void onInit() {
    super.onInit();
    init();
  }

  init() async {
    await fetchNewBook();
  }

  fetchNewBook() async {
    isBusy.value = true;

    var response = await http.get(
      headers: {
        'authorization': "apikey 5zlg2SDxM6dWqrOzUBxNuK:19DK7hZbV8Fb3xluyT9joY",
        'content-type': 'application/json',
      },
      Uri.parse("https://api.collectapi.com/book/newBook"),
    );
    if (response.statusCode == 200) {
      var parsed = json.decode(response.body);
      _newbook.value = NewBook.fromJson(parsed);
    }

    isBusy.value = false;
  }
}
