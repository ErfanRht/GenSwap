import 'dart:io';
import 'package:flutter/material.dart';
import 'package:genswap/home/desktop/components/textfeild.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'components/appbar.dart';
import '../../constants/constants.dart';
import '../../controller.dart';
import 'components/result.dart';
import 'components/copyright.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePageDesktop extends StatelessWidget {
  const HomePageDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    MainController mainController = Get.put(MainController());
    return Builder(builder: (context) {
      return GetBuilder<MainController>(builder: (_) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              const AppBarWidgetDesktop(),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width / 2.5,
                        child: const HomePageTextFeild()),
                    const SizedBox(
                      width: 100,
                    ),
                    SvgPicture.asset(
                      'assets/undraw_night_calls.svg',
                      width: MediaQuery.of(context).size.width / 3,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              const CopyRightWidget()
            ],
          ),
        );
      });
    });
  }
}
