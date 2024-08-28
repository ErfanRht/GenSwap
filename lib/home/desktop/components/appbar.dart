import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:html' as html;

class AppBarWidgetDesktop extends StatelessWidget {
  const AppBarWidgetDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 25),
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
                child: Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                      color: const Color(0xff132d4e),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Text(
                        "Contact Us",
                        style: GoogleFonts.roboto(
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    )),
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
                child: Container(
                    height: 50,
                    width: 200,
                    decoration: BoxDecoration(
                      color: const Color(0xffE11A38),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Text(
                        "About Generations",
                        style: GoogleFonts.roboto(
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    )),
              ),
            ],
          )
        ],
      ),
    );
  }
}
