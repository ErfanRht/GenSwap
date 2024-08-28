import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileBody;
  final Widget desktopBody;
  const ResponsiveLayout(
      {super.key, required this.mobileBody, required this.desktopBody});
  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);
    return LayoutBuilder(builder: (context, constranit) {
      if (constranit.maxWidth < 1125) {
        return mobileBody;
      } else {
        return desktopBody;
      }
    });
  }
}
