part of 'search_soura_cubit.dart';

abstract class SearchSouraState extends Equatable {
  const SearchSouraState();

  @override
  List<Object> get props => [];
}

class SearchSouraInitial extends SearchSouraState {}

class SearchSouraAll extends SearchSouraState {
  final List<QuranModel> surah;

 const SearchSouraAll({required this.surah});
}
class SearchSouraFilter extends SearchSouraState {
  final List<QuranModel> filterSurah;

const   SearchSouraFilter({required this.filterSurah});
}
class SearchSouraFailure extends SearchSouraState {
  
  
}
class SearchSouraLoading extends SearchSouraState {
  
  
}



