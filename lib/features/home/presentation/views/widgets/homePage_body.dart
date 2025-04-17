import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/constants.dart';
import 'package:quran_app/features/home/presentation/manager/categories_cubit/categories_cubit.dart';
import 'package:quran_app/features/home/presentation/views/showAll_page.dart';
import 'package:quran_app/features/home/presentation/views/widgets/custom_appBar.dart';
import 'package:quran_app/features/home/presentation/views/widgets/custom_categories.dart';
import 'package:quran_app/features/home/presentation/views/widgets/doaa_category.dart';
import 'package:quran_app/features/home/presentation/views/widgets/hadeeth_category.dart';
import 'package:quran_app/features/home/presentation/views/widgets/soura_listview.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              const CustomAppBar(),
              const SizedBox(
                height: 10,
              ),
              const CustomCategories(),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(ShowallPage.id);
                  },
                  child: Text(
                    'عرض الكل',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                        color: kTitleColor),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          )),
          BlocBuilder<CategoriesCubit, CategoriesState>(
            builder: (context, state) {
              if (state is CategoriesIndex1) {
                return const SouraListview();
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
