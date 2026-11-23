import 'package:get/state_manager.dart';
import 'package:flutter/material.dart';
import 'package:pas_mobiledev/menu/feat_menu.dart';
import 'package:pas_mobiledev/menu/home_menu.dart';
import 'package:pas_mobiledev/menu/profile_menu.dart';

class MainMenuController extends GetxController {
  final RxInt selectedIndex = 0.obs;
  void changePage(int index) {
    selectedIndex.value = index;
  }
  List<Widget> listPages = [HomeMenu(), FeatMenu(), ProfileMenu()];
} 