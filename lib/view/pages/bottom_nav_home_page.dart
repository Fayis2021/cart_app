import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siddhan/constants/App_assets_constants.dart';
import 'package:siddhan/view/pages/favorite_page.dart';
import 'package:siddhan/view/pages/profile_page.dart';
import 'package:siddhan/view/pages/search_page.dart';

import '../../constants/App_color_constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'cart_page.dart';
import 'home_page.dart';

class BottomNavigation extends StatelessWidget {
  BottomNavigation({super.key});
  final RxInt currentIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: GestureDetector(
                onTap: () {
                  Get.to(() => CartPage());
                },
                child: SvgPicture.asset(AppAssetsConstants.cart)),
          ),
        ],
        centerTitle: true,
        title: Text('Home',
            style: GoogleFonts.getFont(
              "Outfit",
              textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff3D3D3D)),
            )),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            size: 20,
          ),
        ),
      ),
      body: _getBody(),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: currentIndex.value,
          onTap: (index) {
            currentIndex.value = index;
          },
          selectedItemColor: ColorConstants.inactiveColor,
          unselectedItemColor: ColorConstants.activeColor,
          showUnselectedLabels: true,
          selectedLabelStyle: GoogleFonts.getFont("Mulish",
              textStyle: const TextStyle(fontSize: 14)),
          unselectedLabelStyle: GoogleFonts.getFont("Mulish",
              textStyle: const TextStyle(fontSize: 14)),
          items: const [
            BottomNavigationBarItem(
              backgroundColor: ColorConstants.white,
              icon: Icon(
                Icons.home,
                size: 24,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                size: 24,
              ),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                size: 24,
              ),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 24,
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }

  Widget _getBody() {
    return Obx(() {
      switch (currentIndex.value) {
        case 0:
          return HomeScreen();
        case 1:
          return SearchScreen();
        case 2:
          return FavoriteScreen();
        case 3:
          return ProfileScreen();
        default:
          return Container();
      }
    });
  }
}
