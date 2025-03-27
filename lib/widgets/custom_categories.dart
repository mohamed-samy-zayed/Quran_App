import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/constants.dart';
import 'package:quran_app/cubits/categories_cubit/categories_cubit.dart';

class CustomCategories extends StatelessWidget {
  const CustomCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
      child: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            textDirection: TextDirection.rtl,
            children: [
              GestureDetector(
                onTap: () {
                  BlocProvider.of<CategoriesCubit>(context).GetCategories(
                      index1Selected: true,
                      index2Selected: false,
                      index3Selected: false);
                },
                child: Card(
                  elevation: 10,
                  color: kBackgroundColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Container(
                    height: 60,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: state is CategoriesIndex1
                          ? kContainerColor
                          : kBackgroundColor,
                      shape: BoxShape.rectangle,
                    ),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                          top: -38,
                          right: 9,
                          child: ClipRRect(
                            child: Image.asset(
                              'assets/image/quran.png',
                              filterQuality: FilterQuality.low,
                              height: 70,
                              width: 80,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            'القرآن',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w800,
                              color: kTitleColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  BlocProvider.of<CategoriesCubit>(context).GetCategories(
                      index1Selected: false,
                      index2Selected: true,
                      index3Selected: false);
                },
                child: Card(
                  elevation: 10,
                  color: kBackgroundColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Container(
                    height: 60,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: state is CategoriesIndex2
                          ? kContainerColor
                          : kBackgroundColor,
                      shape: BoxShape.rectangle,
                    ),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                          top: -36,
                          right: 15,
                          child: ClipRRect(
                            child: Image.asset(
                              'assets/image/hadeth2.png',
                              filterQuality: FilterQuality.high,
                              height: 60,
                              width: 70,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            'الادعية',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w800,
                              color: kTitleColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  BlocProvider.of<CategoriesCubit>(context).GetCategories(
                      index1Selected: false,
                      index2Selected: false,
                      index3Selected: true);
                },
                child: Card(
                  elevation: 10,
                  color: kBackgroundColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Container(
                    height: 60,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: state is CategoriesIndex3l
                          ? kContainerColor
                          : kBackgroundColor,
                      shape: BoxShape.rectangle,
                    ),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                          top: -30,
                          right: 9,
                          child: ClipRRect(
                            child: Image.asset(
                              'assets/image/hadeeth.png',
                              height: 70,
                              width: 80,
                              filterQuality: FilterQuality.high,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            'الاحاديث',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w800,
                              color: kTitleColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
