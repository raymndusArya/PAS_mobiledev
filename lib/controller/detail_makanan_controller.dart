import 'package:get/get.dart';
import 'package:pas_mobiledev/models/makanan_models.dart';
import 'package:pas_mobiledev/models/transaksi_models.dart';

class DetailMakananController extends GetxController {
  late final MakananModel makanan;
  String jumlah = '';

  @override
  void onInit() {
    super.onInit();
    makanan = Get.arguments as MakananModel;
  }

  void ubahJumlah(String value) {
    jumlah = value;
  }

  TransaksiModels? hitungPembayaran() {
    final jumlahPesanan = int.tryParse(jumlah);

    if (jumlahPesanan == null || jumlahPesanan < 1) {
      Get.snackbar('Jumlah tidak valid', 'Masukkan jumlah minimal 1.');
      return null;
    }

    final harga = int.parse(makanan.harga.replaceAll(RegExp(r'[^0-9]'), ''));
    final subtotal = harga * jumlahPesanan;
    final ppn = subtotal * 0.05;

    return TransaksiModels(subtotal: subtotal, ppn: ppn, total: subtotal + ppn);
  }
}
