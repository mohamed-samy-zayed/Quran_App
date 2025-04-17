import 'package:flutter/material.dart';
import 'package:quran_app/constants.dart';

void showDialogLoading(BuildContext context,{required String text}) {
   
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor:kBackgroundColor,
      title: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: kTitleColor,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      actionsPadding: const EdgeInsets.only(bottom: 20,top: 10),
      
      actions: [
        Center(
          child: CircularProgressIndicator(
            color: kTitleColor,
          ),
        ),
      ],
    ),
  );
  
}