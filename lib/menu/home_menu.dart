import 'package:flutter/material.dart';

class HomeMenu extends StatelessWidget {
  HomeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Home Menu"),
      ),
    );
  }
}