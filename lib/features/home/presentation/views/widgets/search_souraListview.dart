import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/constants.dart';
import 'package:quran_app/features/home/presentation/manager/search_soura_cubit/search_soura_cubit.dart';
import 'package:quran_app/features/home/presentation/views/widgets/soura_item.dart';

class SearchSouraListview extends StatelessWidget {
  const SearchSouraListview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchSouraCubit, SearchSouraState>(
        builder: (context, state) {
      if (state is SearchSouraFilter) {
        return Expanded(
          child: ListView.builder(
            padding: EdgeInsets.zero,
            physics: const BouncingScrollPhysics(),
            itemCount: state.filterSurah.length,
            itemBuilder: (context, index) {
            
              return SouraItem(
                count: ' ايات: ${state.filterSurah[index].ayat}',
                
                description:
                  
                    ' ${(state.filterSurah[index].surahs[0].surahs.replaceAll("بِسۡمِ ٱللَّهِ ٱلرَّحۡمَـٰنِ ٱلرَّحِیمِ", ' ') + state.filterSurah[index].surahs[1].surahs.replaceAll('\n', ' ') + state.filterSurah[index].surahs[2].surahs..replaceAll('\n', ' '))}',
                    
                name: state.filterSurah[index].title,
                number: index + 1,
                type: getType(type: state.filterSurah[index].type),
              );
            },
          ),
        );
      } else if (state is SearchSouraFailure) {
        return Center(
            child: Text(
          'لا توجد نتائج',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.w800, color: kTitleColor),
        ));
      } else if (state is SearchSouraAll) {
        return Expanded(
          child: ListView.builder(
            itemCount: state.surah.length,
            padding: EdgeInsets.zero,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return SouraItem(
                count: ' ايات: ${state.surah[index].ayat}',
                description: state.surah[index].surahs[0].surahs == "بِسۡمِ ٱللَّهِ ٱلرَّحۡمَـٰنِ ٱلرَّحِیمِ" ?
                    ' ${(state.surah[index].surahs[1].surahs.replaceAll('\n', ' ') + state.surah[index].surahs[2].surahs..replaceAll('\n', ' '))}'
                    :' ${(state.surah[index].surahs[0].surahs.replaceAll('\n', ' ') + state.surah[index].surahs[1].surahs..replaceAll('\n', ' '))}',
                name: state.surah[index].title,
                number: index + 1,
                type: getType(type: state.surah[index].type),
              );
            },
          ),
        );
      } else {
        return Center(
          child: CircularProgressIndicator(
            color: kTitleColor,
          ),
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
