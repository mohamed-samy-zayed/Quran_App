import 'package:flutter/material.dart';

class PrayerTime extends StatelessWidget {
  const PrayerTime({
    super.key,
    required this.icon,
    required this.name,
    required this.time,
  });
  final String icon, name, time;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            icon,
            height: 45,
            width: 45,
            fit: BoxFit.fill,
            filterQuality: FilterQuality.high,
          ),
          Text(
            name,
            style: const TextStyle(
                fontSize: 28, color: Colors.white, fontWeight: FontWeight.w700),
          ),
          Text(
            time,
            style: const TextStyle(
                fontSize: 19,
                fontFamily: ' Poppins',
                color: Colors.white,
                fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
