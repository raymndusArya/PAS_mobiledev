import 'package:pas_mobiledev/pages/login_page.dart';
import 'package:pas_mobiledev/pages/main_menu_page.dart';
import 'package:get/get.dart';
import 'package:pas_mobiledev/pages/detail_makanan_page.dart';
import 'package:pas_mobiledev/pages/list_makanan_page.dart';
import 'package:pas_mobiledev/pages/transaksi_page.dart';

class Routes {
  static const loginPage = "/login";
  static const mainMenuPage = "/mainmenu";
  static const detailMakanan = "/detailMakanan";
  static const listMakanan = "/listMakanan";
  static const transaksiPage = "/transaksiPage";

  static final myPages = [
    GetPage(name: loginPage, page: () => LoginPage()),
    GetPage(name: mainMenuPage, page: () => MainMenuPage()),
    GetPage(name: detailMakanan, page: () => DetailMakananPages()),
    GetPage(name: listMakanan, page: () => ListMakananPage()),
    GetPage(name: transaksiPage, page: () => TransaksiPages())
  ];
}

