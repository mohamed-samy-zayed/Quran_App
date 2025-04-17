import 'package:flutter/material.dart';
import 'package:quran_app/core/utils/widgets/custom_bottonNavigation.dart';
import 'package:quran_app/features/home/presentation/views/widgets/homePage_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static String id = 'HomePage';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomePageBody(),
      bottomNavigationBar: CustomBotomNavigation(
        currentIndex: 3,
      ),
    );
  }
}
