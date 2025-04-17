import 'package:flutter/material.dart';
import 'package:quran_app/constants.dart';

class ProfileTile extends StatelessWidget {
  const ProfileTile({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });
  final String title;
  final IconData icon;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: kContainerColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        onTap: onTap,
        leading: Padding(
          padding: const EdgeInsets.only(top: 7),
          child: Icon(
            icon,
            color: kTitleColor,
            size: 30,
          ),
        ),
        minVerticalPadding: 19,
        title: Text(
          title,
          style: TextStyle(
            fontSize: 25,
            color: kTitleColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
