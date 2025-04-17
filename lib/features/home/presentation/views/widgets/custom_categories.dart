import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/constants.dart';
import 'package:quran_app/features/home/presentation/manager/categories_cubit/categories_cubit.dart';
import 'package:quran_app/features/home/presentation/views/widgets/title_category.dart';

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
              TitleCategory(
                right: 9,
                color: state is CategoriesIndex1
                ? kContainerColor
                : kBackgroundColor,
                top: -38,
                image: 'assets/image/quran.png',
                title: 'القرآن',
                height: 70,
                width: 80,
                
onTap: () {
        BlocProvider.of<CategoriesCubit>(context).GetCategories(
            index1Selected: true,
            index2Selected: false,
            index3Selected: false);
      },


              ),

              TitleCategory(onTap: () {
                  BlocProvider.of<CategoriesCubit>(context).GetCategories(
                      index1Selected: false,
                      index2Selected: true,
                      index3Selected: false);
                }, color:state is CategoriesIndex2
                ? kContainerColor
                : kBackgroundColor, top: -36, right: 15, image:'assets/image/hadeth2.png', title: 'الادعية',height: 60,width: 70,)
            , TitleCategory(onTap:  () {
                  BlocProvider.of<CategoriesCubit>(context).GetCategories(
                      index1Selected: false,
                      index2Selected: false,
                      index3Selected: true);
                }, color: state is CategoriesIndex3l
                ? kContainerColor
                : kBackgroundColor, top: -30, right: 9, image: 'assets/image/hadeeth.png', title: 'الاحاديث', height: 70, width: 80)
             
            ],
          );
        },
      ),
    );
  }
}
