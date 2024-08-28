import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:html' as html;

class AppBarWidgetMobile extends StatelessWidget {
  const AppBarWidgetMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              html.window.open('https://ErfanRht.GitHub.IO/GenSwap/', '_blank');
            },
            child: RichText(
              text: TextSpan(
                text: 'Gen',
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff132d4e),
                  ),
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Swap',
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                        color: Color(0xffE11A38),
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Row(
            children: [
              InkWell(
                child: const Icon(
                  Icons.bug_report_rounded,
                  size: 32.5,
                  color: Color(0xffE11A38),
                ),
                onTap: () {
                  html.window.open('https://ErfanRht.GitHub.IO/', '_blank');
                },
              ),
              const SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: () {
                  html.window.open(
                      'https://www.careerplanner.com/career-articles/generations.cfm',
                      '_blank');
                },
                child: const Icon(Icons.info_rounded,
                    size: 30,
                    color: Color(
                      0xff132d4e,
                    )),
              )
            ],
          )
        ],
      ),
    );
  }
}
