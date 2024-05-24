// ignore_for_file: avoid_unnecessary_containers, avoid_print, unnecessary_brace_in_string_interps, unnecessary_string_interpolations, sized_box_for_whitespace

import 'package:al_quran/res/dimension/constants.dart';
import 'package:al_quran/res/dimension/global.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/model_surat.dart';
import '../../res/colors/list_color.dart';
import '../../res/dimension/size.dart';
import '../controller/home_controller.dart';
import '../widget/button/button_back.dart';
import '../widget/label/text_description.dart';

class SuratDetailPage extends StatefulWidget {
  static String? routeName = "/PageDetailSurat";

  const SuratDetailPage({super.key});

  @override
  State<SuratDetailPage> createState() => _SuratDetailPageState();
}

class _SuratDetailPageState extends State<SuratDetailPage>
    with TickerProviderStateMixin {
  // int qariSelectedIndex = 1;
  // List<ModelQari> listQari = [
  //   ModelQari("Abdullah Al Juhhany", "assets/icon/syeikh_1.png", "01"),
  //   ModelQari("Abdullah Muhsin Al Qasim", "assets/icon/syeikh_2.png", "02"),
  //   ModelQari("Abdurrahman as Sudais", "assets/icon/syeikh_3.png", "03"),
  //   ModelQari("Ibrahim-Al-Dossari", "assets/icon/syeikh_4.png", "04"),
  //   ModelQari("Misyari Rasyid Al-'Afasi", "assets/icon/syeikh_5.png", "05")
  // ];
  // String qariSelected = "01";
  final HomeController controller = Get.put(HomeController());
  // late AudioPlayer audioPlayer;
  // late Source audioUrl;
  @override
  Widget build(BuildContext context) {
    controller.audioPlayer = AudioPlayer();

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
                child: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: deviceHeight * .01),
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: deviceWidth / 15),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ButtonBack(
                              () {
                                Navigator.of(context).pop();
                                controller.audioPlayer.stop();
                              },
                              isArrowLeft: true,
                            ),
                            Column(
                              children: [
                                Text(
                                  controller.namaSuratLatin.value,
                                  style: poppinsTextStyle(
                                    fontSize: ContentSize.sizeTextHeaderGlobal,
                                    fontWeight: FontWeight.bold,
                                    textColor: Colors.white,
                                  ),
                                ),
                                Text(
                                  controller.arti.value,
                                  style: poppinsTextStyle(
                                    fontSize:
                                        ContentSize.sizeTextDescriptionGlobal,
                                    fontWeight: FontWeight.w500,
                                    textColor: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            Card(
                              elevation: 2,
                              color: ConstantColors.warnaNonPrimary,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: EdgeInsets.all(deviceWidth * .025),
                                child: Text(
                                  controller.namaArab.value,
                                  style: notosansArabicTextStyle(
                                    fontSize:
                                        ContentSize.sizeTextDescriptionGlobal,
                                    textColor:
                                        ConstantColors.warnaTextPutihGlobal,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: deviceWidth / 12),
                        child: Text(
                          ConstantStrings.RECITATION,
                          style: poppinsTextStyle(
                            fontSize: ContentSize.sizeTextDescriptionGlobal,
                            fontWeight: FontWeight.bold,
                            textColor: ConstantColors.warnaTextPutihGlobal,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: deviceWidth / 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                              controller.listQari.length,
                              (index) => buildItem(
                                  index,
                                  controller.listQari[index].nameQari!,
                                  controller.listQari[index].pictureQari!,
                                  controller.listQari[index].idQari!),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: deviceHeight * .025),
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
                      SizedBox(height: deviceHeight * .02),
                      // if (controller.getSelectionSurat == 1)
                      //   Container(
                      //     margin: EdgeInsets.symmetric(
                      //         horizontal: deviceWidth / 15),
                      //     child: FutureBuilder<DetailSuratAlFatihah>(
                      //       future:
                      //           HomeController.fetchDataDetailSuratAlFatihah(
                      //               noSurat: "1"),
                      //       builder: (context, snapshot) {
                      //         print("${snapshot.error} error");
                      //         print("${snapshot.data} data");
                      //
                      //         if (snapshot.hasData) {
                      //           DetailSuratAlFatihah? detailSurat =
                      //               snapshot.data;
                      //           List<AyatAlFatihah>? listAyat =
                      //               detailSurat!.data!.ayat;
                      //
                      //           if (listAyat != null) {
                      //             listAyat.removeAt(0);
                      //           }
                      //
                      //           return ListView.builder(
                      //             shrinkWrap: true,
                      //             physics: const NeverScrollableScrollPhysics(),
                      //             itemCount: detailSurat.data!.ayat!.length,
                      //             itemBuilder: (context, index) {
                      //               String? urlAudioRecitation;
                      //
                      //               switch (qariSelected) {
                      //                 case "01":
                      //                   urlAudioRecitation = listAyat![index]
                      //                       .audio!
                      //                       .s01
                      //                       .toString();
                      //                   break;
                      //                 case "02":
                      //                   urlAudioRecitation = listAyat![index]
                      //                       .audio!
                      //                       .s02
                      //                       .toString();
                      //                   break;
                      //                 case "03":
                      //                   urlAudioRecitation = listAyat![index]
                      //                       .audio!
                      //                       .s03
                      //                       .toString();
                      //                   break;
                      //                 case "04":
                      //                   urlAudioRecitation = listAyat![index]
                      //                       .audio!
                      //                       .s04
                      //                       .toString();
                      //                   break;
                      //                 case "05":
                      //                   urlAudioRecitation = listAyat![index]
                      //                       .audio!
                      //                       .s05
                      //                       .toString();
                      //                   break;
                      //               }
                      //
                      //               return arabicSurat(
                      //                 numberAyat: index.toString(),
                      //                 translation:
                      //                     listAyat![index].teksIndonesia,
                      //                 ayat: listAyat[index].teksArab,
                      //                 enWording: listAyat[index].teksLatin,
                      //                 urlSurahRecite: urlAudioRecitation,
                      //               );
                      //             },
                      //           );
                      //         } else {
                      //           return const Center(
                      //               child: CircularProgressIndicator());
                      //         }
                      //       },
                      //     ),
                      //   )
                      // else
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: deviceWidth / 15),
                        child: FutureBuilder<DetailSurat>(
                          future: controller.fetchDataDetailSurat(
                              noSurat: controller.getSelectionSurat.toString()),
                          builder: (context, snapshot) {
                            print("${snapshot.error} error");
                            print("${snapshot.data} data");

                            if (snapshot.hasData) {
                              DetailSurat? detailSurat = snapshot.data;
                              List<Ayat>? listAyat = detailSurat!.data!.ayat;

                              if (listAyat != null &&
                                  controller.getSelectionSurat == 1) {
                                listAyat.removeAt(0);
                              }

                              return ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: detailSurat.data!.ayat!.length,
                                itemBuilder: (context, index) {
                                  String? urlSurahAudio;
                                  switch (controller.qariSelected) {
                                    case "01":
                                      urlSurahAudio = listAyat![index]
                                          .audio!
                                          .s01
                                          .toString();
                                      break;
                                    case "02":
                                      urlSurahAudio = listAyat![index]
                                          .audio!
                                          .s02
                                          .toString();
                                      break;
                                    case "03":
                                      urlSurahAudio = listAyat![index]
                                          .audio!
                                          .s03
                                          .toString();
                                      break;
                                    case "04":
                                      urlSurahAudio = listAyat![index]
                                          .audio!
                                          .s04
                                          .toString();
                                      break;
                                    case "05":
                                      urlSurahAudio = listAyat![index]
                                          .audio!
                                          .s05
                                          .toString();
                                      break;
                                  }
                                  return arabicSurat(
                                    numberAyat: index.toString(),
                                    translation: listAyat![index].teksIndonesia,
                                    ayat: listAyat[index].teksArab,
                                    enWording: listAyat[index].teksLatin,
                                    urlSurahRecite: urlSurahAudio,
                                  );
                                },
                              );
                            } else {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget arabicSurat(
      {String? numberAyat,
      String? ayat,
      String? enWording,
      String? translation,
      String? urlSurahRecite}) {
    bool isPlay = false;
    late AnimationController animationControllerPlayButton;
    animationControllerPlayButton =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          color: const Color.fromARGB(235, 246, 241, 251),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: EdgeInsets.all(deviceWidth * .02),
            child: Row(
              children: [
                SizedBox(width: deviceWidth * .01),
                Container(
                  width: deviceWidth * .08,
                  height: deviceWidth * .08,
                  child: CircleAvatar(
                    backgroundColor: ConstantColors.warnaNonPrimary,
                    child: Text(
                      "${int.parse(numberAyat.toString()) + 1}",
                      style: poppinsTextStyle(
                        fontSize: ContentSize.sizeTextDescriptionGlobal,
                      ),
                    ),
                  ),
                ),
                Expanded(child: Container()),
                GestureDetector(
                  key: ValueKey(numberAyat),
                  onTap: () async {
                    if (isPlay == false) {
                      isPlay = true;
                      controller.audioUrl =
                          UrlSource(urlSurahRecite.toString());
                      controller.audioPlayer.play(controller.audioUrl);
                      animationControllerPlayButton.forward();
                      controller.audioPlayer.onPlayerComplete.listen((event) {
                        controller.audioPlayer.stop();
                        animationControllerPlayButton.reverse();
                      });
                      controller.audioPlayer.onPlayerStateChanged
                          .listen((event) {
                        if (event == PlayerState.stopped) {
                          animationControllerPlayButton.reverse();
                        } else if (event == PlayerState.paused) {
                          animationControllerPlayButton.reverse();
                        }
                      });
                    } else if (isPlay == true) {
                      isPlay = false;
                      controller.audioPlayer.pause();
                      animationControllerPlayButton.reverse();
                    }
                  },
                  child: AnimatedIcon(
                    icon: AnimatedIcons.play_pause,
                    progress: animationControllerPlayButton,
                    color: ConstantColors.warnaNonPrimary,
                  ),
                ),
                SizedBox(width: deviceWidth * .04)
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              top: deviceHeight / 25, bottom: deviceHeight / 35),
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              "${ayat}",
              textAlign: TextAlign.right,
              style: notosansArabicTextStyle(
                fontSize: ContentSize.sizeTextArabicDescription,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "${enWording}",
            maxLines: 4,
            style: poppinsTextStyle(
              fontSize: ContentSize.sizeTextDescriptionGlobal,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 0, bottom: deviceHeight / 30),
          child: Container(
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "${translation}",
                maxLines: 4,
                style: poppinsTextStyle(
                  fontSize: ContentSize.sizeTextDescriptionGlobal,
                  textColor: ConstantColors.warnaTextGrayGlobal,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildItem(int index, String nameQari, String picQari, String idQari) {
    double width = controller.qariSelectedIndex == index
        ? deviceWidth / 3.5
        : deviceWidth / 4.5;
    return GestureDetector(
      onTap: () {
        setState(() {
          controller.qariSelectedIndex = index;
          controller.qariSelected = idQari;
          controller.audioPlayer.stop();
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
        width: width,
        // width: deviceWidth / 4,
        margin: EdgeInsets.all(deviceWidth / 30),
        padding: EdgeInsets.all(deviceWidth * .015),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: controller.qariSelectedIndex != index
                ? Border.all(width: 0, color: Colors.transparent)
                : Border.all(color: ConstantColors.selectedColor, width: 5),
            boxShadow: controller.qariSelectedIndex == index
                ? [
                    BoxShadow(
                      color: ConstantColors.selectedColor.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ]
                : null),
        child: Column(
          children: [
            Container(
              width: deviceWidth / 5,
              height: deviceWidth / 5,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage("${picQari}"),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Text(
              "$nameQari",
              textAlign: TextAlign.center,
              maxLines: 2,
              style: poppinsTextStyle(
                fontSize: ContentSize.sizeTextDescriptionGlobal - 4,
                fontWeight: FontWeight.w500,
                textColor: controller.qariSelectedIndex == index
                    ? ConstantColors.selectedColor
                    : ConstantColors.warnaTextHitamGlobal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
