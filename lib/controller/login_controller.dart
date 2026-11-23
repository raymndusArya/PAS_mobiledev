import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pas_mobiledev/models/login_models.dart';
import 'package:pas_mobiledev/pages/main_menu_page.dart';

class LoginController extends GetxController {
  String txtUsername = '';
  String txtPassword = '';

  var isLoading = false.obs;
  var loginModel = Rxn<LoginModels>();

  // untuk hit API
  Future<void> login() async {
    if (txtUsername.isEmpty || txtPassword.isEmpty) {
      Get.snackbar("Error", "Username dan password harus terisi.");
    } else {
      try {
        isLoading.value = true;
        final url = Uri.parse("https://mediadwi.com/api/latihan/login");

        final response = await http.post(
          url,
          body: {"username": txtUsername, "password": txtPassword},
        );

        isLoading.value = false;
        if (response.statusCode == 200) {
          loginModel.value = loginModelsFromJson(response.body);
          //ambil message dari JSONObject
          if (loginModel.value?.status == true) {
            Get.snackbar(
              "Berhasil",
              loginModel.value!.message,
              snackStyle: SnackStyle.FLOATING,
              snackPosition: SnackPosition.TOP,
              backgroundColor: Colors.white,
            );
            Get.off(() => MainMenuPage());
          } else {
            Get.snackbar("Gagal", loginModel.value!.message);
          }
        } else {
          Get.snackbar("Gagal", "Cek koneksi internet");
        }
      } catch (e) {
        Get.snackbar("Gagal", e.toString());
      }
    }
  }
}

