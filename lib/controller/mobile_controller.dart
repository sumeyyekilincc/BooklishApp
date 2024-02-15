import 'package:get/get.dart';

class ControllerMobile extends GetxController {
  RxBool isBusy = false.obs;
  RxInt selectedIndex = 0.obs;
  @override
  void onInit() {
    super.onInit();
    init();
  }

  init() async {}
}
