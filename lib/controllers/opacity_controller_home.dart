import 'package:get/get.dart';

class OpacityFieldsHome extends GetxController {
  RxBool off1 = true.obs;
  RxBool off2 = false.obs;
  
  RxBool childrenimg = false.obs;

  RxList<String> images = [
    "child1.png",
    "child2.png",
    "child5.png",
    "child4.png",
    "child3.png",
    "child6.png"
  ].obs;

  changeViewOfImageOne() {
    off1.value = true;
    off2.value = false;
    update();
  }

  changeViewOfImageTwo() {
    off1.value = false;
    off2.value = true;
    update();
  }
}
