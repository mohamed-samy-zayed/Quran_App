import 'package:flutter/material.dart';
import 'package:quran_app/constants.dart';
import 'package:quran_app/pages/home_page.dart';
import 'package:quran_app/pages/prayer_page.dart';
import 'package:quran_app/pages/profile_page.dart';
import 'package:quran_app/pages/reading_page.dart';

class CustomBotomNavigation extends StatefulWidget {
  const CustomBotomNavigation({
    super.key,
    required this.currentIndex,
  });
  final int currentIndex;

  @override
  State<CustomBotomNavigation> createState() => _CustomBotomNavigationState();
}

class _CustomBotomNavigationState extends State<CustomBotomNavigation> {
  @override
  Widget build(BuildContext context) {
    int selected = widget.currentIndex;
    return BottomNavigationBar(
      currentIndex: selected,
      selectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.w800,
      ),
      unselectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.w800,
      ),
      onTap: (value) {
        setState(() {
          selected = value;
        });
        if (value == 3) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            HomePage.id,
            (route) => false,
          );
        } else if (value == 2) {
          Navigator.pushReplacementNamed(context, PrayerPage.id);
        } else if (value == 1) {
          Navigator.pushReplacementNamed(context, ReadingPage.id);
        } else if (value == 0) {
          Navigator.pushReplacementNamed(context, ProfilePage.id);
        }
      },
      iconSize: 28,
      selectedFontSize: 22,
      unselectedFontSize: 22,
      selectedItemColor: kTitleColor,
      backgroundColor: kBackgroundColor,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Colors.grey[600],
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.account_circle_outlined),
          activeIcon: Container(
              height: 40,
              width: 60,
              decoration: BoxDecoration(
                color: kContainerColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Icon(Icons.account_circle_rounded)),
          label: 'البروفايل',
          backgroundColor: kBackgroundColor,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.headphones_outlined),
          activeIcon: Container(
              height: 40,
              width: 60,
              decoration: BoxDecoration(
                  color: kContainerColor,
                  borderRadius: BorderRadius.circular(15)),
              child: const Icon(Icons.headphones_rounded)),
          label: 'القارئ',
          backgroundColor: kBackgroundColor,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.mosque_outlined),
          activeIcon: Container(
              height: 40,
              width: 60,
              decoration: BoxDecoration(
                color: kContainerColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Icon(Icons.mosque_rounded)),
          label: 'الصلاة',
          backgroundColor: kBackgroundColor,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.home_rounded),
          activeIcon: Container(
              height: 40,
              width: 60,
              decoration: BoxDecoration(
                color: kContainerColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Icon(Icons.home_rounded)),
          label: 'الرئيسية',
          backgroundColor: kBackgroundColor,
        ),
      ],
    );
  }
}
