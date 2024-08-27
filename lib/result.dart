import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'controller.dart';

class ResultAlertDialog extends StatelessWidget {
  const ResultAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(builder: (_) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        backgroundColor: Colors.white,
        title: Text(
          "How Would A ${_.selectedGen} Person Say It?",
          style: GoogleFonts.roboto(
            textStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        content: Text(
          _.result,
          style: GoogleFonts.roboto(
            textStyle: const TextStyle(
              fontSize: 24,
              color: Color(0xffE11A38),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text(
              'Close',
              style: GoogleFonts.roboto(
                textStyle: const TextStyle(
                  fontSize: 18,
                  color: Color(0xffE11A38),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            onPressed: () {
              Get.back(); // Closes the dialog
            },
          ),
        ],
      );
    });
  }
}
