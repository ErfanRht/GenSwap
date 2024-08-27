import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'appbar.dart';
import 'constants/constants.dart';
import 'controller.dart';
import 'result.dart';
import 'widgets/copyright.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    MainController mainController = Get.put(MainController());
    return Builder(builder: (context) {
      return GetBuilder<MainController>(builder: (_) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              const AppBarWidget(),
              const SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2.5,
                      child: Column(
                        children: [
                          Text(
                            "Get A Quick, Free Translation Between Generations",
                            // softWrap: true,
                            maxLines: 3,
                            style: GoogleFonts.roboto(
                                textStyle: const TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            )),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5, bottom: 15),
                            child: Row(
                              children: [
                                Text(
                                  "From: ",
                                  style: GoogleFonts.roboto(
                                      textStyle: const TextStyle(
                                          fontSize: 17.5,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Text(
                                  "Normal English (Any Generation)",
                                  style: GoogleFonts.roboto(
                                      textStyle: const TextStyle(
                                          color: Color(0xffE11A38),
                                          fontSize: 17.5,
                                          fontWeight: FontWeight.bold)),
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 60,
                            padding: const EdgeInsets.only(left: 25.0),
                            decoration: BoxDecoration(
                              color: const Color(0xffF2F2F2),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    controller: _.textEditingController,
                                    decoration: const InputDecoration(
                                      hintText: 'Enter your message',
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: RoundedLoadingButton(
                                    borderRadius: 25,
                                    width: 100,
                                    color: const Color(0xffE11A38),
                                    controller: _.btnController,
                                    successColor: Colors.greenAccent,
                                    onPressed: () async {
                                      try {
                                        await fetchResult();
                                        _.btnController.success();
                                        await Future.delayed(
                                            const Duration(milliseconds: 1500));
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return const ResultAlertDialog();
                                          },
                                        );
                                      } catch (error) {
                                        print(error);
                                        _.btnController.error();
                                      }
                                      await Future.delayed(
                                          const Duration(seconds: 5));
                                      _.btnController.reset();
                                    },
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 17.5, vertical: 10),
                                      child: Icon(Icons.translate_rounded,
                                          size: 30, color: Colors.white),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5, top: 20),
                            child: Row(
                              children: [
                                Text(
                                  "To:",
                                  style: GoogleFonts.roboto(
                                      textStyle: const TextStyle(
                                          fontSize: 17.5,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Container(
                                  width: 375,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                  child: DropdownButtonFormField<String>(
                                    value: "Gen Z (1996 - 2012)",
                                    items: generations.map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(
                                          value,
                                          style: const TextStyle(
                                              fontSize: 16.0,
                                              color: Colors.black),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      _.setStates(newSelectedGen: newValue);
                                    },
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.red, width: 2.0),
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 12.0, horizontal: 10.0),
                                      //labelText: "Select Generation",
                                      labelStyle:
                                          TextStyle(color: Colors.grey[600]),
                                      filled: true,
                                      fillColor: Colors.grey[200],
                                    ),
                                    dropdownColor: Colors.white,
                                    icon: const Icon(Icons.arrow_drop_down,
                                        color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 100,
                    ),
                    SvgPicture.asset(
                      'assets/undraw_night_calls.svg',
                      width: MediaQuery.of(context).size.width / 3,
                    )
                  ],
                ),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     IconButton(
              //       icon: const Icon(Icons.mic, color: Colors.grey),
              //       onPressed: () {},
              //     ),
              //     const SizedBox(width: 20),
              //     IconButton(
              //       icon: const Icon(Icons.camera_alt, color: Colors.grey),
              //       onPressed: () {},
              //     ),
              //     const SizedBox(width: 20),
              //     IconButton(
              //       icon: const Icon(Icons.attach_file_rounded,
              //           color: Colors.grey),
              //       onPressed: () {},
              //     ),
              //   ],
              // ),
              // const CopyRightWidget()
            ],
          ),
        );
      });
    });
  }
}
