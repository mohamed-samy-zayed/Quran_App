part of 'get_azkar_cubit.dart';

@immutable
abstract class GetAzkarState {}

class GetAzkarInitial extends GetAzkarState {}
class GetAzkarSucess extends GetAzkarState {
  final List<DoaaModel> azkar;

  GetAzkarSucess({required this.azkar});
}
class GetAzkarLoading extends GetAzkarState {}

class GetAzkarFailure extends GetAzkarState {
  final String errorMessage;

  GetAzkarFailure({required this.errorMessage});
}


