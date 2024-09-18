import 'dart:math';
import 'package:flutter/material.dart';
import 'package:genswap/constants/constants.dart';
import 'package:get/get.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

import '.api.dart';

class MainController extends GetxController {
  TextEditingController textEditingController = TextEditingController();
  final RoundedLoadingButtonController btnController =
      RoundedLoadingButtonController();
  String selectedGen = generations[1];
  String result = "";

  void setStates({
    TextEditingController? newTextEditingController,
    String? newSelectedGen,
    String? newResult,
  }) {
    textEditingController = newTextEditingController ?? textEditingController;
    selectedGen = newSelectedGen ?? selectedGen;
    result = newResult ?? result;
    update();
  }
}

Future<void> fetchResult() async {
  MainController mainController = Get.put(MainController());
  final usedApiKeys = <int>[];
  bool success = false;

  for (var i = 0; i < apiKey.length; i++) {
    final randomIndex = Random().nextInt(apiKey.length);

    if (usedApiKeys.contains(randomIndex)) {
      // Key already used, skip to next iteration
      i--;
      continue;
    }

    usedApiKeys.add(randomIndex);
    try {
      final model = GenerativeModel(
          model: 'gemini-1.5-flash', apiKey: apiKey[randomIndex]);
      final content = [
        Content.text(
            "Translate the below sentence to ${mainController.selectedGen} and only return one sentence without double qoute mark or any extra response:\n'${mainController.textEditingController.text}'")
      ];
      final response = await model.generateContent(content);
      print(response.text);
      mainController.setStates(newResult: response.text);
      print('API key number ${randomIndex + 1} succeded');
      success = true;
      break; // Exit the loop after successful generation
    } catch (e) {
      print('API key number ${randomIndex + 1} failed duo to: $e');
    }
  }
  if (!success) {
    int result = 10 ~/
        0; // This will throw a `IntegerDivisionByZeroException` resulting the TextFeild function to know fetching wasn't successfull
  }
}
