import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quran_app/constants.dart';
import 'package:quran_app/pages/Login_page.dart';
import 'package:quran_app/widgets/custom_bottonNavigation.dart';
import 'package:quran_app/widgets/profile_tile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  static String id = 'ProfilePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          backgroundColor: kBackgroundColor,
          centerTitle: false,
          automaticallyImplyLeading: false,
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 40),
              child: Text(
                'البروفايل',
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 35,
                  color: kTitleColor,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: const CustomBotomNavigation(currentIndex: 0),
        body: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        'assets/image/user.png',
                        fit: BoxFit.cover,
                        filterQuality: FilterQuality.high,
                        height: 130,
                        width: 130,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 110,
                    right: 180,
                    child: Container(
                      alignment: Alignment.center,
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: kContainerColor,
                          shape: BoxShape.rectangle),
                    ),
                  ),
                  Positioned(
                    top: 101,
                    right: 171,
                    child: IconButton(
                        alignment: Alignment.center,
                        onPressed: () {},
                        icon: Icon(
                          Icons.add_rounded,
                          color: kTitleColor,
                          size: 30,
                          weight: 5,
                        )),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                '@mohamedsamy',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.grey[800],
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: kContainerColor,
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(60),
                          topLeft: Radius.circular(60))),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 10),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 2,
                        ),
                        SizedBox(
                          width: 120,
                          child: Divider(
                            color: Colors.grey[600],
                            thickness: 4,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const ProfileTile(
                          title: 'Mohamed Samy',
                          icon: Icons.person_rounded,
                        ),
                        const ProfileTile(
                          title: 'samyelsayedpgs1@gmail.com',
                          icon: Icons.email_rounded,
                        ),
                        const ProfileTile(
                          title: 'تغيير كلمة المرور',
                          icon: Icons.security_rounded,
                        ),
                        ProfileTile(
                          title: 'تسجيل الخروج',
                          icon: Icons.delete_rounded,
                          onTap: () {
                            signOutMethod();
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              LoginPage.id,
                              (route) => false,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }

  Future<void> signOutMethod() async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    googleSignIn.disconnect();
    await FirebaseAuth.instance.signOut();
  }
}
