import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quran_app/constants.dart';
import 'package:quran_app/pages/Login_page.dart';
import 'package:quran_app/pages/home_page.dart';
import 'package:quran_app/widgets/custom_button.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          Text(
            'قارئ القرآن',
            textDirection: TextDirection.rtl,
            style: TextStyle(
              color: kTitleColor,
              fontWeight: FontWeight.bold,
              fontSize: 46,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'تعلم االقرآن كل يوم واستمع إلي  \n      أفضل القراء في أي وقت',
            textDirection: TextDirection.rtl,
            style: TextStyle(
              color: kTextColor,
              fontWeight: FontWeight.w100,
              fontSize: 28,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          ClipRect(
            child: Image.asset(
              'assets/image/logo.png',
              filterQuality: FilterQuality.high,
              height: 400,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          CustomButton(
          title: 'ابدأ',
          pushNamed:() {
            if (FirebaseAuth.instance.currentUser == null || FirebaseAuth.instance.currentUser!.emailVerified == false){
              Navigator.pushReplacementNamed(context, LoginPage.id,);
            }else{
              Navigator.pushReplacementNamed(context, HomePage.id,);
            }
          
        }, 
         )
        ],
      ),
    );
  }
}
