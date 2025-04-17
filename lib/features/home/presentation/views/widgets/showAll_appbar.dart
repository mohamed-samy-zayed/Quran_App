import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/constants.dart';

class ShowallAppbar extends StatelessWidget {
  const ShowallAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,

      children: [
        IconButton(onPressed: (){
                  Navigator.pop(context);
                }, icon: Icon(Icons.arrow_back_ios_rounded,color: kTitleColor,
                size: 30,
                
                )),

              
                Text('القرآن الكريم', style: GoogleFonts.scheherazadeNew().copyWith(
                  color: kTitleColor,
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                 
                ),),

                const  SizedBox(width:20),
                 
                
      ],
    );
  }
}