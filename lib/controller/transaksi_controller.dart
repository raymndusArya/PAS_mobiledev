import 'package:get/get.dart';
import 'package:pas_mobiledev/models/transaksi_models.dart';

class TransaksiController extends GetxController {
  final transaksi = Rxn<TransaksiModels>();

  @override
  void onInit() {
    super.onInit();

    final argument = Get.arguments;
    if (argument is TransaksiModels) {
      transaksi.value = argument;
    }
  }

  void setTransaksi(TransaksiModels value) {
    transaksi.value = value;
  }
}
