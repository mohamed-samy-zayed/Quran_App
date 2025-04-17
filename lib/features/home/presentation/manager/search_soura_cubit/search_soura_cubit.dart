import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quran_app/features/home/data/models/quran_model.dart';
import 'package:quran_app/features/home/data/repos/Get_surah.dart';

part 'search_soura_state.dart';

class SearchSouraCubit extends Cubit<SearchSouraState> {
  SearchSouraCubit() : super(SearchSouraInitial());

  Future<void> filterSoura({String? name}) async {
    final replace = RegExp(r'[\u064B-\u0652]');
    List<QuranModel> surahs = await GetSurah().getSurah();
    if (name == null || name.isEmpty) {
      emit(SearchSouraAll(surah: surahs));
     
    } else {
      emit(SearchSouraLoading());

      var filteredList = surahs
          .where(
            (filterSurah) => filterSurah.title
                .toString()
                .replaceAll(replace, '')
                .replaceAll('ٱ', 'ا')
                .replaceAll('أ', 'ا')
                .replaceAll('إ', 'ا')
                .replaceAll('آ', 'ا')
                .contains(name),
          )
          .toList();
      if (filteredList.isNotEmpty) {
        emit(SearchSouraFilter(filterSurah: filteredList));
      } else {
        emit(SearchSouraFailure());
      }
    }
  }

  Future<void> filterAyat({String? name}) async {
     final replace = RegExp(r'[\u064B-\u0652]');
    List<QuranModel> surahs = await GetSurah().getSurah();
    if (name == null || name.isEmpty) {
      emit(SearchSouraAll(surah: surahs));
    } else {
      emit(SearchSouraLoading());

      final filteredList = surahs
          .where(
            (filterSurah) => filterSurah.surahs
                .toString()
                .replaceAll(replace, '')
                .replaceAll('ٱ', 'ا')
                .replaceAll('أ', 'ا')
                .replaceAll('إ', 'ا')
                .replaceAll('آ', 'ا')
                .contains(name),
          )
          .toList();
      if (filteredList.isNotEmpty) {
        emit(SearchSouraFilter(filterSurah: filteredList));
      } else {
        emit(SearchSouraFailure());
      }
    }
  }
}
