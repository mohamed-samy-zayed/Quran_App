import 'package:flutter/material.dart';
import 'package:quran_app/features/splah/presentation/views/widgets/splash_body.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});
  static String id = 'SplashPage';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashBody(),
    );
  }
}
