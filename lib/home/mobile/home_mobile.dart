import 'package:flutter/material.dart';
import 'package:genswap/controller.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'components/appbar.dart';
import 'components/copyright_mobile.dart';
import 'components/textfeild.dart';

class HomePageMobile extends StatelessWidget {
  const HomePageMobile({super.key});

  @override
  Widget build(BuildContext context) {
    MainController mainController = Get.put(MainController());

    return Builder(builder: (context) {
      return GetBuilder<MainController>(builder: (_) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              children: [
                const AppBarWidgetMobile(),
                const SizedBox(
                  height: 7.5,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  width: 600,
                  child: const HomePageTextFeildMobile(),
                ),
                const SizedBox(
                  height: 25,
                ),
                SvgPicture.asset(
                  'assets/undraw_night_calls.svg',
                  width: MediaQuery.of(context).size.width / 1.5,
                ),
                const SizedBox(
                  height: 50,
                ),
                const CopyRightWidgetMobile()
              ],
            ),
          ),
        );
      });
    });
  }
}
