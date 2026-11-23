import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobiledev/components/custom_textfield.dart';
import 'package:pas_mobiledev/controller/login_controller.dart';
import 'package:pas_mobiledev/components/custom_button.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  static const Color bgColor = Color(0xFF2B2B2B);
  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: bgColor,
        title: Text("Login", style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Text(
              "Login",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 20),

            Container(
              width: 400,
              child: CustomTextfield(
                myHint: "Masukkan Username",
                onChanged: (value) => controller.txtUsername = value,
              ),
            ),
            SizedBox(height: 20),

            Container(
              width: 400,
              child: CustomTextfield(
                myHint: "Masukkan Password",
                onChanged: (value) => controller.txtPassword = value,
              ),
            ),

            SizedBox(height: 20),

            Obx(
              () => controller.isLoading.value
                  ? CircularProgressIndicator()
                  : SizedBox(
                      width: 400,
                      height: 50,
                      child: CustomButton(
                        myText: "Lanjutkan",
                        onPressed: () {
                          controller.login();
                        },
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
