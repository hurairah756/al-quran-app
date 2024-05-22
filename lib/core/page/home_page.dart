// ignore_for_file: avoid_unnecessary_containers, unnecessary_brace_in_string_interps, unnecessary_string_interpolations, avoid_print

import 'package:al_quran/core/page/surat_detail_page.dart';
import 'package:al_quran/res/dimension/constants.dart';
import 'package:al_quran/res/dimension/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../model/model_doa.dart';
import '../../model/model_juz.dart';
import '../../res/colors/list_color.dart';
import '../../res/dimension/size.dart';
import '../controller/home_controller.dart';
import '../widget/label/text_description.dart';
import 'doa_detail_page.dart';

class HomePage extends StatefulWidget {
  static String? routeName = "/PageHomeScreen";

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // int selectedIndex = 0;
  final HomeController controller = Get.put(HomeController());
  late List<Data> listDataJuz;

  @override
  void initState() {
    super.initState();
    controller.fetchDataJuz().then((juzData) {
      controller.listJuz.value = juzData;
    }).catchError((error) {
      print('Internet Not Connected');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/icon/wp_background.png",
            width: deviceWidth,
            height: deviceHeight,
            fit: BoxFit.fill,
          ),
          SafeArea(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: deviceWidth / 20),
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              ConstantStrings.AL_QURAN,
                              style: poppinsTextStyle(
                                fontSize: ContentSize.sizeTextHeaderGlobal,
                                fontWeight: FontWeight.bold,
                                textColor: ConstantColors.warnaTextPutihGlobal,
                              ),
                            ),
                            Text(
                              ConstantStrings.AL_QURAN_READ,
                              maxLines: 2,
                              style: notoNashtaliqTextStyle(
                                  fontSize:
                                      ContentSize.sizeTextDescriptionGlobal,
                                  fontWeight: FontWeight.w500,
                                  textColor:
                                      ConstantColors.warnaTextPutihGlobal),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        transform:
                            Matrix4.translationValues(0, deviceHeight / 30, 0),
                        child: SvgPicture.asset(
                          "assets/icon/ic_kaligrafi.svg",
                          fit: BoxFit.cover,
                          width: deviceWidth * 0.1,
                          height: deviceHeight * 0.12,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: deviceHeight * .03),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        ConstantStrings.LAST_READ,
                        style: poppinsTextStyle(
                            fontSize: ContentSize.sizeTextDescriptionGlobal,
                            fontWeight: FontWeight.bold,
                            textColor: ConstantColors.warnaTextPutihGlobal),
                      ),
                    ],
                  ),
                  SizedBox(height: deviceHeight * .015),
                  Obx(() {
                    return Card(
                      elevation: 5,
                      child: controller.nomorSurah.value == ""
                          ? Container(
                              child: Padding(
                                padding: EdgeInsets.all(deviceWidth * .025),
                                child: Text(
                                  ConstantStrings.LAST_READ_SURAH,
                                  style: poppinsTextStyle(
                                      fontSize: ContentSize
                                          .sizeTextDescriptionGlobal),
                                ),
                              ),
                            )
                          : Padding(
                              padding: EdgeInsets.all(deviceWidth * .015),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(width: deviceWidth * .005),
                                  Stack(
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.all(deviceWidth * .02),
                                        child: SvgPicture.asset(
                                            "assets/icon/ic_ayat.svg"),
                                      ),
                                      Positioned.fill(
                                        child: Center(
                                          child: Text(
                                            controller.nomorSurah.value,
                                            style: poppinsTextStyle(
                                                fontSize: ContentSize
                                                    .sizeTextDescriptionGlobal),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          controller.namaSuratLatin.value,
                                          style: poppinsTextStyle(
                                              fontSize: ContentSize
                                                  .sizeTextDescriptionGlobal,
                                              textColor: ConstantColors
                                                  .warnaTextHitamGlobal),
                                        ),
                                        Text(
                                          controller.arti.value,
                                          style: poppinsTextStyle(
                                              fontSize: ContentSize
                                                  .sizeTextDescriptionGlobal,
                                              textColor: ConstantColors
                                                  .warnaTextGrayGlobal),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Card(
                                    elevation: 2,
                                    color: ConstantColors.warnaNonPrimary,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        controller.namaArab.value,
                                        style: notosansArabicTextStyle(
                                          fontSize: ContentSize
                                              .sizeTextDescriptionGlobal,
                                          textColor: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: deviceWidth * .01)
                                ],
                              ),
                            ),
                    );
                  }),
                  SizedBox(height: deviceHeight * .015),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        ConstantStrings.CATEGORY,
                        style: poppinsTextStyle(
                          fontSize: ContentSize.sizeTextDescriptionGlobal,
                          fontWeight: FontWeight.bold,
                          textColor: ConstantColors.warnaTextPutihGlobal,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: deviceHeight * .015),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      children: [
                        buildItem(0, ConstantStrings.SURAH),
                        buildItem(1, ConstantStrings.M_DOA),
                      ],
                    ),
                  ),
                  SizedBox(height: deviceHeight * .015),
                  if (controller.selectedIndex == 0)
                    Expanded(
                      child: FutureBuilder<Juz>(
                        future: controller.fetchDataJuz(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            Juz juzData = snapshot.data!;
                            controller.listJuz.value.data = juzData.data;
                            List<Data>? listData =
                                controller.listJuz.value.data;
                            return ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: listData!.length,
                              itemBuilder: (context, index) {
                                return AnimationConfiguration.staggeredList(
                                  position: index,
                                  duration: const Duration(milliseconds: 2375),
                                  child: FadeInAnimation(
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: cardJuz(
                                          noJuz:
                                              listData[index].nomor.toString(),
                                          namaJuz:
                                              listData[index].nama.toString(),
                                          namaLatin: listData[index]
                                              .namaLatin
                                              .toString(),
                                          tempatTurun: listData[index]
                                              .tempatTurun
                                              .toString(),
                                          jumlahAyat: listData[index]
                                              .jumlahAyat
                                              .toString(),
                                          arti: listData[index].arti,
                                          nama: listData[index].nama),
                                    ),
                                  ),
                                );
                              },
                            );
                          } else if (snapshot.hasError) {
                            return const Center(child: Text('Check Internet!'));
                            // Text("Error: ${snapshot.error}");
                          } else if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                        },
                      ),
                    )
                  else
                    Expanded(
                      child: FutureBuilder<List<Doa>>(
                        future: controller.fetchDataDoa(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            List<Doa>? listData = snapshot.data;
                            return ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: listData!.length,
                              itemBuilder: (context, index) {
                                return AnimationConfiguration.staggeredList(
                                    position: index,
                                    duration:
                                        const Duration(milliseconds: 2375),
                                    child: cardDoa(
                                        noDoa: listData[index].id.toString(),
                                        namaDoa: listData[index].doa.toString(),
                                        doaArab: listData[index].ayat,
                                        doaLatin: listData[index].latin,
                                        doaTranslate: listData[index].artinya));
                              },
                            );
                          } else if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return const Center(child: Text('Check Internet!'));
                            // Text("Error: ${snapshot.error}");
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
        ],
      ),
    );
  }

  Widget cardDoa(
      {String? noDoa,
      String? namaDoa,
      String? doaArab,
      String? doaLatin,
      String? doaTranslate}) {
    return Card(
      elevation: 0.5,
      color: Colors.white,
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: InkWell(
        onTap: () {
          controller.idDoa.value = noDoa;
          controller.doaName.value = namaDoa;
          controller.doaAyat.value = doaArab;
          controller.doaLatin.value = doaLatin.toString();
          controller.doaTranslation.value = doaTranslate.toString();
          Get.toNamed(DoaDetailPage.routeName.toString());
        },
        splashColor: ConstantColors.warnaNonPrimary,
        child: Padding(
          padding: EdgeInsets.only(
              top: deviceHeight * .025,
              bottom: deviceHeight * .025,
              left: deviceWidth * .02),
          child: Row(
            children: [
              SizedBox(width: deviceWidth * .02),
              Stack(
                children: [
                  SvgPicture.asset("assets/icon/ic_ayat.svg"),
                  Positioned.fill(
                    child: Center(
                      child: Text(
                        noDoa!,
                        style: poppinsTextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          textColor: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(width: deviceWidth * .02),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      namaDoa!,
                      style: poppinsTextStyle(
                        fontSize: ContentSize.sizeTextDescriptionGlobal,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: deviceHeight * .01),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        doaArab!,
                        maxLines: 1,
                        style: notosansArabicTextStyle(
                          fontSize: ContentSize.sizeTextDescriptionGlobal,
                          textColor: ConstantColors.warnaTextHitamGlobal,
                        ),
                      ),
                    ),
                    // Text(
                    //   doaLatin!,
                    //   style: poppinsTextStyle(
                    //     fontSize: ContentSize.sizeTextDescriptionGlobal,
                    //     textColor: ConstantColors.warnaTextGrayGlobal,
                    //   ),
                    // ),
                  ],
                ),
              ),
              SizedBox(width: deviceWidth * .02)
            ],
          ),
        ),
      ),
    );
  }

  Widget cardJuz(
      {String? noJuz,
      String? namaJuz,
      String? tempatTurun,
      String? jumlahAyat,
      String? namaLatin,
      String? arti,
      String? nama}) {
    return Card(
      elevation: 0.5,
      color: Colors.white,
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: InkWell(
        onTap: () {
          controller.setNameSuratSelected(namaJuz!);
          controller.nomorSurah.value = noJuz!;
          controller.setSelectionSurat(int.parse(noJuz));
          controller.descBawah.value = "${tempatTurun} * ${jumlahAyat} AYAT";
          controller.arti.value = "$arti";
          controller.namaArab.value = nama!;
          controller.namaSuratLatin.value = namaLatin.toString();
          Get.toNamed(SuratDetailPage.routeName.toString());
        },
        splashColor: ConstantColors.warnaNonPrimary,
        child: Padding(
          padding: EdgeInsets.only(
              left: deviceWidth * .02,
              top: deviceHeight * .025,
              bottom: deviceHeight * .025),
          child: Row(
            children: [
              SizedBox(width: deviceWidth * .02),
              Stack(
                children: [
                  SvgPicture.asset(
                    "assets/icon/ic_ayat.svg",
                  ),
                  Positioned.fill(
                    child: Center(
                      child: Text(
                        "${noJuz}",
                        style: poppinsTextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          textColor: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(width: deviceWidth * .02),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    namaLatin!,
                    style: poppinsTextStyle(
                      fontSize: ContentSize.sizeTextDescriptionGlobal,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Text(
                    "${tempatTurun} * ${jumlahAyat} ${ConstantStrings.AYAT}",
                    style: poppinsTextStyle(
                      fontSize: ContentSize.sizeTextDescriptionGlobal,
                      textColor: ConstantColors.warnaTextGrayGlobal,
                    ),
                  ),
                ],
              ),
              Expanded(child: Container()),
              Text(
                namaJuz!,
                style: notosansArabicTextStyle(
                  fontSize: ContentSize.sizeTextDescriptionGlobal,
                  textColor: ConstantColors.warnaTextHitamGlobal,
                ),
              ),
              const SizedBox(width: 20)
            ],
          ),
        ),
      ),
    );
  }

  Expanded buildItem(int index, String title) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            controller.selectedIndex = index;
          });
        },
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: controller.selectedIndex == index
                ? ConstantColors.selectedColor
                : Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: notoNashtaliqTextStyle(
              fontSize: ContentSize.sizeTextDescriptionGlobal,
              fontWeight: FontWeight.w500,
              textColor: controller.selectedIndex == index
                  ? ConstantColors.warnaTextPutihGlobal
                  : ConstantColors.warnaTextHitamGlobal,
            ),
          ),
        ),
      ),
    );
  }
}
