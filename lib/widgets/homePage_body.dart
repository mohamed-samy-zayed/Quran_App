import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/cubits/categories_cubit/categories_cubit.dart';
import 'package:quran_app/widgets/custom_appBar.dart';
import 'package:quran_app/widgets/custom_categories.dart';
import 'package:quran_app/widgets/doaa_category.dart';
import 'package:quran_app/widgets/hadeeth_category.dart';
import 'package:quran_app/widgets/soura_category.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, top: 40),
      child: Column(
        children: [
          const CustomAppBar(
            
          ),
          const SizedBox(
            height: 10,
          ),
          const CustomCategories(),
          const SizedBox(
            height: 15,
          ),
          BlocBuilder<CategoriesCubit, CategoriesState>(
            builder: (context, state) {
              if (state is CategoriesIndex1) {
                return const SouraCategory();
              } else if (state is CategoriesIndex2) {
                return const DoaaCategory();
              } else {
                return const HadethCategory();
              }
            },
          )
        ],
      ),
    );
  }
}
