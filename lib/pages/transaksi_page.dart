import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobiledev/controller/transaksi_controller.dart';
import 'package:intl/intl.dart';

class TransaksiPages extends StatelessWidget {
  TransaksiPages({super.key});

  static final formatAngka = NumberFormat.decimalPattern('id_ID');
  
  String Rp(num nilai) => 
    'Rp.${formatAngka.format(nilai.round())}';

  final controller = Get.put(TransaksiController());
  static const Color bgColor = Color(0xFF2B2B2B);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Transaksi Page")),
      body: Obx(() {
        final transaksi = controller.transaksi.value;

        if (transaksi == null) {
          return Center(child: Text("Tidak ada transaksi"));
        }
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Subtotal: ${Rp(transaksi.subtotal)}',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22),
              ),

              SizedBox(height: 30),

              Text(
                'PPN: ${Rp(transaksi.ppn)}',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22),
              ),

              SizedBox(height: 22),

              Text(
                'Total: ${Rp(transaksi.total)}',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22),
              ),

              SizedBox(height: 22),
            ],
          ),
        );
      }),
    );
  }
}
