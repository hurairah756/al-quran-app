// ignore_for_file: avoid_print
import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../model/model_doa.dart';
import '../../model/model_juz.dart';
import '../../model/model_qari.dart';
import '../../model/model_surat.dart';
import '../../model/model_surat_alfatihah.dart';
import '../../services/api/api.dart';

class HomeController extends GetxController {
  // Surat Detail observables

  RxInt selectionSurat = 0.obs;
  var namaSuratDiPilih = "".obs;
  var listJuz = Juz().obs;
  var idSuratDipilih = "".obs;
  var arti = "".obs;
  var descBawah = "".obs;
  var namaArab = "".obs;
  var namaSuratLatin = "".obs;
  var nomorSurah = "".obs;

  // Doa Detail observables

  var idDoa = "".obs;
  var doaName = "".obs;
  var doaAyat = "".obs;
  var doaLatin = "".obs;
  var doaTranslation = "".obs;

  //  pages string
  int selectedIndex = 0;

  // surat detail
  int qariSelectedIndex = 1;
  List<ModelQari> listQari = [
    ModelQari("Abdullah Al Juhhany", "assets/icon/syeikh_1.png", "01"),
    ModelQari("Abdullah Muhsin Al Qasim", "assets/icon/syeikh_2.png", "02"),
    ModelQari("Abdurrahman as Sudais", "assets/icon/syeikh_3.png", "03"),
    ModelQari("Ibrahim-Al-Dossari", "assets/icon/syeikh_4.png", "04"),
    ModelQari("Misyari Rasyid Al-'Afasi", "assets/icon/syeikh_5.png", "05")
  ];
  String qariSelected = "01";
  late AudioPlayer audioPlayer;
  late Source audioUrl;

  @override
  void onInit() {
    super.onInit();
    fetchDataJuz().then((data) {
      listJuz.value = data;
    });
  }

  int get getSelectionSurat => selectionSurat.value;

  void setSelectionSurat(int select) {
    selectionSurat.value = select;
    print("Letter Selected Successfully");
  }

  void setNameSuratSelected(String namaSurat) {
    namaSuratDiPilih.value = namaSurat;
    print("Letter Successfully Set");
  }

  String get getNamaSurat => namaSuratDiPilih.value;

  Future<Juz> fetchDataJuz() async {
    Uri uri = Uri.parse(API.BASE_POINT_SURAT);
    final responseResult = await http.get(uri);
    return Juz.fromJson(jsonDecode(responseResult.body));
  }

  Future<DetailSurat> fetchDataDetailSurat({String? noSurat}) async {
    Uri uri = Uri.parse(API.BASE_POINT_DETAIL_SURAT + noSurat.toString());
    print(uri.toString());
    final responseResult = await http.get(uri);
    print("response ${responseResult.body}");
    return DetailSurat.fromJson(jsonDecode(responseResult.body));
  }

  Future<DetailSuratAlFatihah> fetchDataDetailSuratAlFatihah(
      {String? noSurat}) async {
    Uri uri = Uri.parse(API.BASE_POINT_DETAIL_SURAT + noSurat.toString());
    print(uri.toString());
    final responseResult = await http.get(uri);
    print("response ${responseResult.body}");
    return DetailSuratAlFatihah.fromJson(jsonDecode(responseResult.body));
  }

  Future<List<Doa>> fetchDataDoa() async {
    Uri uri = Uri.parse(API.BASE_POINT_DOA);
    final responseResult = await http.get(uri);
    print(jsonDecode(responseResult.body));
    List<dynamic> jsonResponse = jsonDecode(responseResult.body);
    return jsonResponse.map((data) => Doa.fromJson(data)).toList();
  }
}
