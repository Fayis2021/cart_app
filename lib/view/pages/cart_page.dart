import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../constants/App_assets_constants.dart';
import '../../constants/App_color_constants.dart';
import '../../constants/App_name_constants.dart';
import '../../controllers/shopping_cart_controller.dart';
import '../../model/shopping_cart_model.dart';
import '../widgets/cart_item_widget.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class CartPage extends StatelessWidget {
  CartPage({super.key});
  ShopingCart shopingCart = Get.put(ShopingCart());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstants.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            AppNamesConstants.shoppingCart,
            style: GoogleFonts.getFont(
              'Outfit',
              textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff3D3D3D)),
            ),
          ),
          actions: [
            GestureDetector(
                onTap: () {
                  Get.to(() => CartPage());
                },
                child: SvgPicture.asset(
                  AppAssetsConstants.cart,
                  width: 20,
                  height: 20,
                )),
            const SizedBox(
              width: 16,
            ),
          ],
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                size: 20,
                color: Color(0xff292D32),
              )),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: GetBuilder<ShopingCart>(builder: (controller) {
                return ListView.builder(
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      ShoppingCartItem item = ShoppingCartItem.fromJson(
                          shopingCart.shoppingCartList[index]);
                      return Dismissible(
                        direction: DismissDirection.endToStart,
                        key: ValueKey(item),
                        onDismissed: (direction) {
                          controller.shoppingCartList[index]["itemcount"] = 0;
                        },
                        background: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
                          child: Container(
                              width: ScreenUtil().setWidth(343),
                              color: const Color(0xffE03A3E).withOpacity(0.1),
                              alignment: Alignment.centerRight,
                              padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 8)
                                  .copyWith(right: 61),
                              child: SvgPicture.asset(
                                AppAssetsConstants.trash,
                                width: 24,
                                height: 24,
                              )),
                        ),
                        child: item.itemCount > 0
                            ? cartItems(context,
                                amount: item.amount,
                                image: item.image,
                                name: item.name,
                                size: item.size,
                                count: item.itemCount,
                                index: index)
                            : const SizedBox(),
                      );
                    });
              }),
            ),
            Container(
              height: 90,
              color: ColorConstants.white,
              child: Center(
                child: Container(
                  height: 48,
                  width: 335,
                  decoration: const BoxDecoration(
                      color: Color(0xff9C4400),
                      borderRadius: BorderRadius.all(Radius.circular(4))),
                  child: Center(
                    child: Text(AppNamesConstants.proceed,
                        style: GoogleFonts.getFont(
                          "Outfit",
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: ColorConstants.white),
                        )),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
