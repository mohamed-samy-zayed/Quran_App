part of 'getsurah_cubit_cubit.dart';

@immutable
abstract class GetsurahCubitState {}

class GetsurahCubitInitial extends GetsurahCubitState {}
class GetsurahCubitLoading extends GetsurahCubitState {}
class GetsurahCubitSuccess extends GetsurahCubitState {
  final List<QuranModel>  quranModel;

  GetsurahCubitSuccess({required this.quranModel});
}
class GetsurahCubitFailure extends GetsurahCubitState {
  final String errorMessage;

  GetsurahCubitFailure({required this.errorMessage});
}



