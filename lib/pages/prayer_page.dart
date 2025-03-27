import 'package:flutter/material.dart';
import 'package:quran_app/widgets/custom_bottonNavigation.dart';
import 'package:quran_app/widgets/prayerPage_body.dart';

class PrayerPage extends StatelessWidget {
  const PrayerPage({super.key});
  static String id = 'PrayerPage';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar:  CustomBotomNavigation(currentIndex: 2),
      body: PrayerBody(),
    );
  }
}
