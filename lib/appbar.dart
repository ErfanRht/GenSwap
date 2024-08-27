import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
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
          Row(
            children: [
              GestureDetector(
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
              ),
              const SizedBox(
                width: 20,
              ),
              GestureDetector(
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
