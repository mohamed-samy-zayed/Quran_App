import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:quran_app/constants.dart';
import 'package:quran_app/features/home/presentation/manager/categories_cubit/categories_cubit.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
late String currentTime;
Timer? timer;
  
@override
// Initialize the current time and Start the timer
  void initState() {
    super.initState();
    currentTime = getTime(); 
    startTimer(); 
  }

  @override
  // Cancel the timer when the widget is disposed
  void dispose() {
    timer?.cancel(); 
    super.dispose();
  }

// Update the time every minute
  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
    
    String newTime = getTime();
      if (newTime != currentTime) {
  setState(() {
    currentTime = getTime(); 
  });
}
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        BlocBuilder<CategoriesCubit, CategoriesState>(
          builder: (context, state) {
            if (state is CategoriesIndex1) {
              return Expanded(
                child: ClipRRect(
                  child: Image.asset(
                    'assets/image/home.png',
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.fill,
                    height: 210,
                  ),
                ),
              );
            } else if (state is CategoriesIndex2) {
              return Expanded(
                child: ClipRRect(
                  child: Image.asset(
                    'assets/image/home2.png',
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.fill,
                    height: 210,
                  ),
                ),
              );
            } else {
              return Expanded(
                child: ClipRRect(
                  child: Image.asset(
                    'assets/image/home2.png',
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.fill,
                    height: 210,
                  ),
                ),
              );
            }
          },
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'قارئ القرآن',
              style: TextStyle(
                color: kTitleColor,
                fontWeight: FontWeight.w900,
                fontSize: 40,
              ),
            ),
            BlocBuilder<CategoriesCubit, CategoriesState>(
                builder: (context, state) {
              if (state is CategoriesIndex1) {
                return Text(
                  'قراءة القرآن بسهولة',
                  style: TextStyle(
                    color: kTextColor,
                    fontWeight: FontWeight.w800,
                    fontSize: 24,
                  ),
                );
              } else if (state is CategoriesIndex2) {
                return Text(
                  'قراءة الادعية بسهولة',
                  style: TextStyle(
                    color: kTextColor,
                    fontWeight: FontWeight.w800,
                    fontSize: 24,
                  ),
                );
              } else {
                return Text(
                  'حفظ الاحاديث بسهولة',
                  style: TextStyle(
                    color: kTextColor,
                    fontWeight: FontWeight.w100,
                    fontSize: 24,
                  ),
                );
              }
            }),
            Text(
              currentTime,
              style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 45,
                  fontFamily: 'Poppins'),
            ),
            Text(
              'رمضان   23/1444',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 22,
                color: kTextColor,
              ),
            ),
            Container(
              height: 40,
              width: 140,
              decoration: BoxDecoration(
                color: kTitleColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  '${getTime(a: ' a')}  فَجر',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 18,
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
    
//Get the current time 
  String getTime({String a = ''}) {
  DateTime date = DateTime.now();
   String  time = DateFormat('hh:mm$a').format(date);

    return time;
  }
}
