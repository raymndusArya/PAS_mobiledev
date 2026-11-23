import 'package:flutter/material.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({super.key});

  static const backgroundColor = Color(0xFF2B2B2B);
  static const cardColor = Color(0xFF383838);
  static const accentColor = Color(0xFF7C9EFF);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
        backgroundColor: backgroundColor,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          // ini buat bagian profil, nama, dan jurusan
          Card(
            color: cardColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 28, horizontal: 20),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 52,
                    backgroundColor: accentColor,
                    child: Text(
                      'A',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),

                  // nama
                  Text(
                    'Raymundus Arya',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),

                  // jurusan
                  Text(
                    'Software Engineer',
                    style: TextStyle(color: Colors.white70, fontSize: 15),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16),

          // buat bagian kelas dan bio
          Card(
            color: cardColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(width: 10),
                      Text(
                        'Kelas / No. Absen',
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      'XI RPL 2 / 35',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  Row(
                    children: [
                      SizedBox(width: 10),
                      Text(
                        'Bio',
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      'Siswa RPL di SMK Raden Umar Said Kudus',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight(40),
                        fontSize: 16,
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
