// ignore_for_file: avoid_unnecessary_containers, avoid_print, unnecessary_brace_in_string_interps, unnecessary_string_interpolations, sized_box_for_whitespace

import 'package:al_quran/res/dimension/constants.dart';
import 'package:al_quran/res/dimension/global.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../res/colors/list_color.dart';
import '../../res/dimension/size.dart';
import '../controller/home_controller.dart';
import '../widget/button/button_back.dart';
import '../widget/label/text_description.dart';

class DoaDetailPage extends StatefulWidget {
  static String? routeName = "/PageDetailDoa";

  const DoaDetailPage({super.key});

  @override
  State<DoaDetailPage> createState() => _DoaDetailPageState();
}

class _DoaDetailPageState extends State<DoaDetailPage> {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Image.asset(
              "assets/icon/ic_background_baca.png",
              width: deviceWidth,
              height: deviceHeight,
              fit: BoxFit.fill,
            ),
            Container(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: deviceHeight * 0.45,
                      child: Image.asset(
                        "assets/icon/doa_hands_logo.jpg",
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(height: deviceHeight * .02),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        ConstantStrings.BISMILLAH,
                        style: notosansArabicTextStyle(
                          fontSize: ContentSize.sizeTextHeaderGlobal,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: deviceHeight * .01),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        ConstantStrings.BISMILLAH_TL,
                        maxLines: 2,
                        style: notoNashtaliqTextStyle(
                          fontSize: ContentSize.sizeTextDescriptionGlobal,
                          textColor: ConstantColors.warnaTextHitamGlobal,
                        ),
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: deviceWidth / 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: deviceHeight / 25,
                                bottom: deviceHeight / 35),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                controller.doaName.value,
                                style: notosansArabicTextStyle(
                                  fontSize: ContentSize.sizeTextHeading,
                                  fontWeight: FontWeight.bold,
                                  textColor:
                                      ConstantColors.warnaTextPutihGlobal,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: deviceHeight / 35),
                            child: Text(
                              controller.doaAyat.value,
                              maxLines: 5,
                              textAlign: TextAlign.right,
                              style: notosansArabicTextStyle(
                                fontSize: ContentSize.sizeTextHeaderGlobal,
                                fontWeight: FontWeight.normal,
                                textColor: Colors.black,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              controller.doaLatin.value,
                              maxLines: 4,
                              style: poppinsTextStyle(
                                fontSize: ContentSize.sizeTextDescriptionGlobal,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: deviceHeight * .01,
                                bottom: deviceHeight / 20),
                            child: Container(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  controller.doaTranslation.value,
                                  maxLines: 4,
                                  style: poppinsTextStyle(
                                    fontSize:
                                        ContentSize.sizeTextDescriptionGlobal,
                                    textColor:
                                        ConstantColors.warnaTextGrayGlobal,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              // margin: EdgeInsets.symmetric(horizontal: deviceWidth / 20),
              child: Padding(
                padding: EdgeInsets.only(
                  left: deviceWidth / 20,
                  top: deviceHeight / 25,
                  right: deviceWidth / 20,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ButtonBack(
                      () => Navigator.of(context).pop(),
                      isArrowLeft: true,
                    ),
                    Expanded(child: Container()),
                    Container(
                      width: deviceWidth * .10,
                      height: deviceWidth * .10,
                      child: CircleAvatar(
                        backgroundColor: ConstantColors.warnaNonPrimary,
                        child: Text(
                          controller.idDoa.value,
                          style: poppinsTextStyle(
                            fontSize: ContentSize.sizeTextDescriptionGlobal,
                            textColor: ConstantColors.warnaTextPutihGlobal,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
