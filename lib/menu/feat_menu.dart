import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobiledev/controller/list_team_controller.dart';

class FeatMenu extends StatelessWidget {
  FeatMenu({super.key});
  final controller = Get.put(ListTeamController());
  static const Color bgColor = Color(0xFF2B2B2B);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Feat"),
        backgroundColor: const Color(0xFF2B2B2B),
        foregroundColor: Colors.white,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        if (controller.errorMessage.value.isNotEmpty) {
          return Center(
            child: Text(
              controller.errorMessage.value,
              style: TextStyle(color: Colors.white),
            ),
          );
        }

        return ListView.builder(
          itemCount: controller.teams.length,
          itemBuilder: (context, index) {
            final team = controller.teams[index];

            return ListTile(
              leading: team.strBadge.isEmpty
                  ? Icon(Icons.sports_soccer, color: Colors.white)
                  : Image.network(
                      team.strBadge,
                      width: 48,
                      height: 48,
                      errorBuilder: (context, error, StackTrace) =>
                          Icon(Icons.sports_soccer, color: Colors.white),
                    ),
              title: Text(team.strTeam, style: TextStyle(color: Colors.white)),
              subtitle: Text(
                team.strStadium,
                style: TextStyle(color: Colors.white),
              ),
            );
          },
        );
      }),
    );
  }
}
