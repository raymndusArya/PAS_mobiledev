import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobiledev/controller/list_makanan_controller.dart';
import 'package:pas_mobiledev/routes.dart';
import 'package:pas_mobiledev/components/custom_makanan_card.dart';

class HomeMenu extends StatelessWidget {
  HomeMenu({super.key});

  final controller = Get.put(ListMakananController());
    static const Color bgColor = Color(0xFF2B2B2B);
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
        backgroundColor: bgColor,
        appBar: AppBar(
          title: Text("List Makanan"),
          centerTitle: true,
          backgroundColor: bgColor,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        body: Container(
          margin: EdgeInsets.all(10),
          child: Obx(
            () => ListView.builder(
              itemCount: controller.makananList.length,
              itemBuilder: (context, index) {
                final makanan = controller.makananList[index];

                return CustomMakananCard(
                  makanan: makanan,
                  onTap: () {
                    Get.toNamed(Routes.detailMakanan, 
                    arguments: makanan);
                  },
                  );
              })
          ),
        ),
    );
  }
}