import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quran_app/models/quran_model.dart';
import 'package:quran_app/services/Get_surah.dart';

part 'getsurah_cubit_state.dart';

class GetsurahCubitCubit extends Cubit<GetsurahCubitState> {
  GetsurahCubitCubit() : super(GetsurahCubitInitial());
 

 Future<void> getSurah() async{

emit(GetsurahCubitLoading());
try { 
  List<QuranModel> quranModel = await GetSurah().getSurah();
  emit(GetsurahCubitSuccess(quranModel: quranModel));
} on Exception catch (e) {
  emit(GetsurahCubitFailure(errorMessage: e.toString()));
}


 }
  
}
