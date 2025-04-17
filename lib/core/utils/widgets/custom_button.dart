import 'package:flutter/material.dart';
import 'package:quran_app/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    required this.pushNamed,
  });
  final String title ;
  final void Function() pushNamed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            fixedSize: const Size(350, 60),
            backgroundColor: kTextColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        onPressed: pushNamed,
        child: Text(
          title,
          textDirection: TextDirection.rtl,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 29,
          ),
        ));
  }
}
