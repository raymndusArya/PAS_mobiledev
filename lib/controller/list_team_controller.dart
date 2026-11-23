import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pas_mobiledev/models/list_team_models.dart';

class ListTeamController extends GetxController {
  final teams = <Team>[].obs;
  final isLoading = true.obs;
  final errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchTeams();
  }

  Future<void> fetchTeams() async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      final url = Uri.parse(
        'https://www.thesportsdb.com/api/v1/json/123/search_all_teams.php?l=English%20Premier%20League',
      );
      final response = await http.get(url).timeout(const Duration(seconds: 15));

      if (response.statusCode != 200) {
        errorMessage.value = 'Gagal mengambil data (${response.statusCode}).';
        return;
      }

      final data = jsonDecode(response.body);
      if (data is! Map<String, dynamic>) {
        throw const FormatException('Format respons tidak sesuai.');
      }

      final dataTim = data['teams'];
      if (dataTim == null) {
        teams.clear();
        return;
      }
      if (dataTim is! List) {
        throw const FormatException('Daftar tim tidak valid.');
      }

      teams.assignAll(
        dataTim.map((item) {
          if (item is! Map<String, dynamic>) {
            throw const FormatException('Data tim tidak valid.');
          }
          return Team.fromJson(item);
        }),
      );
    } on FormatException catch (error) {
      errorMessage.value = 'Data API tidak valid: ${error.message}';
    } on http.ClientException catch (error) {
      errorMessage.value = 'Gagal terhubung ke API: ${error.message}';
    } on TimeoutException {
      errorMessage.value = 'Permintaan API melewati batas waktu.';
    } finally {
      isLoading.value = false;
    }
  }
}
