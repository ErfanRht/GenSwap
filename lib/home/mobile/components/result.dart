import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:typewritertext/typewritertext.dart';

import '../../../controller.dart';

class ResultAlertDialog extends StatefulWidget {
  const ResultAlertDialog({super.key});

  @override
  _ResultAlertDialogState createState() => _ResultAlertDialogState();
}

class _ResultAlertDialogState extends State<ResultAlertDialog> {
  final regexThe = RegExp(r'\bthe\b', caseSensitive: false);
  final regexParentheses = RegExp(r'\s*\(.*?\)');
  bool _isCopied = false;
  double _opacity = 1.0;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(builder: (_) {
      return Stack(
        children: [
          AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
            backgroundColor: Colors.white,
            title: Center(
              child: Text(
                "A ${_.selectedGen.replaceAll(regexParentheses, '').replaceAll(regexThe, '')} Person would say: ",
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            content: Container(
              padding: const EdgeInsets.only(top: 25),
              height: MediaQuery.of(context).size.width / 8,
              width: MediaQuery.of(context).size.width / 2,
              decoration: BoxDecoration(
                color: const Color(0xffF2F2F2),
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 55),
                child: TypeWriter.text(
                  _.result,
                  duration: const Duration(milliseconds: 50),
                  style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                      fontSize: 24,
                      color: Color(0xffE11A38),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text(
                  'Copy',
                  style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: _.result)).then((_) {
                    setState(() {
                      _isCopied = true;
                      _opacity = 1.0;
                    });

                    // Start the fade-out animation after a delay
                    Future.delayed(const Duration(seconds: 1), () {
                      setState(() {
                        _opacity = 0.0;
                      });
                    });

                    // Hide the message completely after the animation duration
                    Future.delayed(const Duration(seconds: 3), () {
                      setState(() {
                        _isCopied = false;
                      });
                    });
                  });
                },
              ),
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
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          if (_isCopied)
            Positioned(
              bottom: 20,
              left: MediaQuery.of(context).size.width *
                  0.25, // Center it horizontally with some padding
              right: MediaQuery.of(context).size.width *
                  0.25, // Center it horizontally with some padding
              child: AnimatedOpacity(
                opacity: _opacity,
                duration: const Duration(seconds: 2),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.grey[800], // More grey, less black
                    borderRadius:
                        BorderRadius.circular(20), // Increased border radius
                  ),
                  child: Center(
                      child: DefaultTextStyle(
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    child: const Text(
                      'Text copied to clipboard',
                    ),
                  )),
                ),
              ),
            ),
        ],
      );
    });
  }
}
