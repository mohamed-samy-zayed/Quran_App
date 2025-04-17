import 'package:flutter/material.dart';
import 'package:quran_app/constants.dart';

void ShowSnackBar(BuildContext context, {required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text(
        message,
        style: TextStyle(
          color: kTitleColor,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
        textDirection: TextDirection.rtl,
      ),
      width: 250,
      duration: const Duration(seconds: 2),
      backgroundColor: kContainerColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
  );
}
