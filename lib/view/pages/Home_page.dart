import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/App_assets_constants.dart';
import '../../constants/App_name_constants.dart';
import '../../controllers/opacity_controller_home.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  OpacityFieldsHome opacitycontroller = OpacityFieldsHome();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
    );
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 12,
          ),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(ScreenUtil().setSp(16)),
              child: Container(
                width: ScreenUtil().setWidth(343),
                height: ScreenUtil().setHeight(200),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(ScreenUtil().setSp(16)),
                ),
                child:
                    Image.asset(AppAssetsConstants.dis, fit: BoxFit.fitWidth),
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Trending Collection For You",
                  style: GoogleFonts.getFont("Outfit",
                      textStyle: const TextStyle(
                          color: Color(0xff0A191E),
                          fontWeight: FontWeight.w400,
                          fontSize: 16)),
                ),
                Text(
                  AppNamesConstants.viewAll,
                  style: GoogleFonts.getFont(
                    "Outfit",
                    textStyle: const TextStyle(
                        color: Color(0xff9C4400),
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Stack(
            children: [
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      if (opacitycontroller.off1.value) {
                        opacitycontroller.off1.value = false;
                        opacitycontroller.off2.value = false;
                      } else {
                        opacitycontroller.changeViewOfImageOne();
                      }
                    },
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(ScreenUtil().setSp(16)),
                      child: Container(
                        width: ScreenUtil().setWidth(343),
                        height: ScreenUtil().setHeight(188),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(ScreenUtil().setSp(16)),
                        ),
                        child: Obx(
                          () => Opacity(
                              opacity: opacitycontroller.off1.value ? 1 : 0.1,
                              child: Image.asset(
                                fit: BoxFit.fill,
                                AppAssetsConstants.off1,
                              )),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Obx(
                    () => GestureDetector(
                      onTap: () {
                        if (opacitycontroller.off2.value) {
                          opacitycontroller.off2.value = false;
                          opacitycontroller.off1.value = false;
                        } else {
                          opacitycontroller.changeViewOfImageTwo();
                        }
                      },
                      child: ClipRRect(
                        borderRadius:
                            BorderRadius.circular(ScreenUtil().setSp(12)),
                        child: Container(
                          width: ScreenUtil().setWidth(343),
                          height: ScreenUtil().setHeight(188),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(ScreenUtil().setSp(16)),
                          ),
                          child: Opacity(
                            opacity: opacitycontroller.off2.value ? 1 : 0.1,
                            child: Image.asset(
                              AppAssetsConstants.off2,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 21,
                  ),
                ],
              ),
              Positioned(
                  top: 50,
                  left: 0,
                  right: 10,
                  bottom: 50,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      height: ScreenUtil().setHeight(376),
                      width: ScreenUtil().setHeight(190),
                      // 230
                      child: GridView.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 12,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisSpacing: 12,
                        children: List.generate(6, (index) {
                          return ClipRRect(
                            borderRadius:
                                BorderRadius.circular(ScreenUtil().setSp(6)),
                            child: Container(
                              width: 124,
                              height: 108,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    ScreenUtil().setSp(6)),
                              ),
                              child: Obx(
                                () => Opacity(
                                    opacity:
                                        opacitycontroller.off2.value == false &&
                                                opacitycontroller.off1.value ==
                                                    false
                                            ? 1
                                            : 0.1,
                                    child: Image.asset(
                                        "assets/${opacitycontroller.images[index]}",
                                        fit: BoxFit.cover)),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
