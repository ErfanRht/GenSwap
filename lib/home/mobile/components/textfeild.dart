import 'package:flutter/material.dart';
import 'package:genswap/constants/constants.dart';
import 'package:genswap/controller.dart';
import 'package:genswap/home/desktop/components/result.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:typewritertext/typewritertext.dart';

class HomePageTextFeildMobile extends StatelessWidget {
  const HomePageTextFeildMobile({super.key});

  @override
  Widget build(BuildContext context) {
    FocusNode focusNode = FocusNode();
    return GetBuilder<MainController>(builder: (_) {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TypeWriter.text(
              "Get A Quick, Free Translation Between Generations",
              textAlign: TextAlign.center,
              duration: const Duration(milliseconds: 50),
              maxLines: 3,
              style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                fontSize: 32.5,
                fontWeight: FontWeight.bold,
              )),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5, bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "From: ",
                  style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                          fontSize: 17.5, fontWeight: FontWeight.bold)),
                ),
                Text(
                  "English (Any Generation)",
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: TextField(
                    focusNode: focusNode,
                    controller: _.textEditingController,
                    decoration: const InputDecoration(
                      hintText: 'Enter your text here',
                      border: InputBorder.none,
                    ),
                    onSubmitted: (__) {
                      // Trigger the button press when Enter is pressed
                      if (_.btnController.currentState == ButtonState.idle) {
                        _.btnController.start();
                      }
                    },
                  ),
                ),
                RoundedLoadingButton(
                  borderRadius: 25,
                  width: 100,
                  color: const Color(0xffE11A38),
                  controller: _.btnController,
                  successColor: Colors.greenAccent,
                  onPressed: () async {
                    try {
                      await fetchResult();
                      _.btnController.success();
                      await Future.delayed(const Duration(milliseconds: 1500));
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
                    await Future.delayed(const Duration(seconds: 5));
                    _.btnController.reset();
                  },
                  child: const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 17.5, vertical: 10),
                    child: Icon(Icons.translate_rounded,
                        size: 30, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "To:",
                  style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                          fontSize: 17.5, fontWeight: FontWeight.bold)),
                ),
                Container(
                  width: 375,
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
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
                              fontSize: 16.0, color: Colors.black),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      _.setStates(newSelectedGen: newValue);
                    },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.red, width: 2.0),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 10.0),
                      labelStyle: TextStyle(color: Colors.grey[600]),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                    dropdownColor: Colors.white,
                    icon:
                        const Icon(Icons.arrow_drop_down, color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}
