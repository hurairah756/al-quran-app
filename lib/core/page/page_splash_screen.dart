import 'package:al_quran/core/page/home_page.dart';
import 'package:al_quran/res/dimension/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../res/colors/list_color.dart';
import '../../res/dimension/constants.dart';
import '../../res/dimension/size.dart';
import '../widget/label/text_description.dart';

class SplashScreen extends StatefulWidget {
  static String? routeName = "/PageSplashScreen";

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Get.offAndToNamed(
        HomePage.routeName.toString(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  // ConstantColors.gradientTopColor, // #08F4F9
                  // ConstantColors.gradientBottomColor
                  Colors.blueAccent,
                  Colors.lightBlueAccent,
                  Colors.greenAccent,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SafeArea(
                  child: Text(
                    ConstantStrings.AL_QURAN,
                    style: poppinsTextStyle(
                        fontSize: ContentSize.sizeTextHeaderGlobal,
                        fontWeight: FontWeight.bold,
                        textColor: ConstantColors.warnaTextPutihGlobal),
                  ),
                ),
                SizedBox(height: deviceHeight * .04),
                SvgPicture.asset(
                  "assets/icon/ic_kaligrafi.svg",
                  fit: BoxFit.cover,
                  width: deviceWidth / 1.5,
                  height: deviceHeight / 7,
                ),
                SizedBox(height: deviceHeight * .04),
                Text(
                  ConstantStrings.AL_QURAN_READ,
                  maxLines: 2,
                  style: notoNashtaliqTextStyle(
                      fontSize: ContentSize.sizeTextDescriptionGlobal,
                      fontWeight: FontWeight.w500,
                      textColor: ConstantColors.warnaTextPutihGlobal),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
