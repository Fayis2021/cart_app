import 'package:get/get.dart';

class ShopingCart extends GetxController {
  RxList<Map<String, dynamic>> shoppingCartList = <Map<String, dynamic>>[
    {
      "name": "Neck T-Shirt With Pocket",
      "size": "M",
      "rate": 400.0,
      "amount": 400.0,
      "itemcount": 1,
      "image": "assets/tshirt1.png"
    },
    {
      "name": "Round-Neck T-Shirt",
      "size": "xxl",
      "rate": 240.0,
      "amount": 240.0,
      "itemcount": 1,
      "image": "assets/tshirt2.png"
    },
    {
      "name": "Checked Polo T-shirt",
      "size": "M",
      "rate": 750.0,
      "amount": 750.0,
      "itemcount": 1,
      "image": "assets/tshirt3.png"
    }
  ].obs;

  void incrementAmount(int index, double newAmount) {
    shoppingCartList[index]["amount"] = newAmount;
    update();
  }
}
