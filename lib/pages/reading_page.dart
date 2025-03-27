import 'package:flutter/material.dart';
import 'package:quran_app/widgets/custom_bottonNavigation.dart';
import 'package:quran_app/widgets/readingPage_body.dart';

class ReadingPage extends StatelessWidget {
  const ReadingPage({super.key});
  static String id = 'ReadingPage';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar:  CustomBotomNavigation(currentIndex: 1),
      body: ReadingPageBody(),
    );
  }
}
