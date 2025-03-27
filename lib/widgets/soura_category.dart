import 'package:card_loading/card_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/cubits/getsurah_cubit/getsurah_cubit_cubit.dart';
import 'package:quran_app/widgets/tile_category.dart';

class SouraCategory extends StatelessWidget {
  const SouraCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<GetsurahCubitCubit>(context).getSurah();

    return BlocBuilder<GetsurahCubitCubit, GetsurahCubitState>(
        builder: (context, state) {
      if (state is GetsurahCubitSuccess) {
        return Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: state.quranModel.length,
            padding: const EdgeInsets.only(left: 20, bottom: 15),
            itemBuilder: (context, index) {
              return TileCategory(
                count: ' ايات: ${state.quranModel[index].ayat}',
                description:
                    ' ${(state.quranModel[index].surahs[1].surahs.replaceAll('\n', ' ') + state.quranModel[index].surahs[2].surahs..replaceAll('\n', ' '))}',
                name: state.quranModel[index].title,
                number: index + 1,
                type: getType(type: state.quranModel[index].type),
              );
            },
          ),
        );
      } else {
        return Expanded(
          child: ListView.builder(
              itemCount: 10,
              padding: const EdgeInsets.only(left: 15),
              itemBuilder: (context, index) {
                return const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CardLoading(
                      height: 30,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      width: 100,
                      margin: EdgeInsets.only(bottom: 10),
                    ),
                    CardLoading(
                      height: 100,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      margin: EdgeInsets.only(bottom: 10),
                    ),
                    CardLoading(
                      height: 30,
                      width: 200,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      margin: EdgeInsets.only(bottom: 10),
                    ),
                  ],
                );
              }),
        );
      }
    });
  }

  String getType({required String type}) {
    if (type == 'Meccan') {
      return 'مكية';
    } else {
      return 'مدنية';
    }
  }
}
