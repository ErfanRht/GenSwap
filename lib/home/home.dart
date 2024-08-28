import 'package:flutter/material.dart';
import 'package:genswap/responsive/responsive_layout.dart';
import 'desktop/home_desktop.dart';
import 'mobile/home_mobile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
        mobileBody: HomePageMobile(), desktopBody: HomePageDesktop());
  }
}
