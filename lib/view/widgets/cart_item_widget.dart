import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/App_color_constants.dart';
import '../../controllers/shopping_cart_controller.dart';

Widget cartItems(context,
    {required String name,
    required String size,
    required double amount,
    required String image,
    required int count,
    required int index}) {
  return GetBuilder<ShopingCart>(builder: (controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Container(
        height: 128,
        width: ScreenUtil().setWidth(343),
        decoration: BoxDecoration(
          color: ColorConstants.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 12,
            ),
            SizedBox(
              height: 88,
              width: 88,
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  child: Image.asset(image, fit: BoxFit.cover)),
            ),
            const SizedBox(
              width: 12,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.25,
              width: MediaQuery.of(context).size.width * 0.6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(name,
                            style: GoogleFonts.getFont("Outfit",
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: Color(0xff3D3D3D)))),
                        Text('Size : $size',
                            style: GoogleFonts.getFont("Outfit",
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: Color(0xff8F8F8F)))),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('₹ $amount',
                          style: GoogleFonts.getFont("Outfit",
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                  color: Color(0XFF4C4C4C)))),
                      Container(
                        height: 40,
                        width: 100,
                        decoration: BoxDecoration(
                          color: const Color(0xffF0F0F0),
                          border: Border.all(
                            color: const Color(0xffF0F0F0),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 2, horizontal: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  if (controller.shoppingCartList[index]
                                          ["itemcount"] >
                                      1) {
                                    controller.shoppingCartList[index]
                                        ["itemcount"]--;
                                    controller.incrementAmount(
                                        index,
                                        controller.shoppingCartList[index]
                                                ["rate"] *
                                            controller.shoppingCartList[index]
                                                ["itemcount"]);
                                  }
                                },
                                child: const Icon(
                                  Icons.remove,
                                  size: 16,
                                  color: Color(0xff9C4400),
                                ),
                              ),
                              Text(count.toString(),
                                  style: GoogleFonts.getFont(
                                    "Outfit",
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                        color: Color(0xff000000)),
                                  )),
                              GestureDetector(
                                onTap: () {
                                  controller.shoppingCartList[index]
                                      ["itemcount"]++;
                                  controller.incrementAmount(
                                      index,
                                      controller.shoppingCartList[index]
                                              ["rate"] *
                                          controller.shoppingCartList[index]
                                              ["itemcount"]);
                                },
                                child: const Icon(
                                  Icons.add,
                                  size: 16,
                                  color: Color(0xff9C4400),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  });
}
