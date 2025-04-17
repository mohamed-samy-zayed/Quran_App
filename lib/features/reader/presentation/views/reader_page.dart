import 'package:flutter/material.dart';
import 'package:quran_app/core/utils/widgets/custom_bottonNavigation.dart';
import 'package:quran_app/features/reader/presentation/views/widgets/readerPage_body.dart';

class ReaderPage extends StatelessWidget {
  const ReaderPage({super.key});
  static String id = 'ReaderPage';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar:  CustomBotomNavigation(currentIndex: 1),
      body: ReadrPageBody(),
    );
  }
}
