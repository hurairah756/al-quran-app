import 'dart:io';

import 'package:al_quran/core/page/doa_detail_page.dart';
import 'package:al_quran/res/dimension/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'core/page/home_page.dart';
import 'core/page/page_splash_screen.dart';
import 'core/page/surat_detail_page.dart';
import 'httpovveride.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.sizeOf(context).height;
    deviceWidth = MediaQuery.sizeOf(context).width;
    deviceAverageSize = (deviceHeight + deviceWidth) / 2;
    return ScreenUtilInit(
      minTextAdapt: true,
      builder: (_, context) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: SplashScreen.routeName,
          getPages: [
            GetPage(
                name: SplashScreen.routeName.toString(),
                page: () => const SplashScreen(),
                transition: Transition.fadeIn),
            GetPage(
                name: HomePage.routeName.toString(),
                page: () => const HomePage(),
                transition: Transition.leftToRight),
            GetPage(
                name: SuratDetailPage.routeName.toString(),
                page: () => const SuratDetailPage(),
                transition: Transition.rightToLeft),
            GetPage(
                name: DoaDetailPage.routeName.toString(),
                page: () => const DoaDetailPage(),
                transition: Transition.rightToLeft),
          ],
        );
      },
    );
  }
}
