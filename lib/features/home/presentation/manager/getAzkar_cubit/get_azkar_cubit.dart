import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quran_app/features/home/data/models/doaa_model.dart';
import 'package:quran_app/features/home/data/repos/Get_doaa.dart';

part 'get_azkar_state.dart';

class GetAzkarCubit extends Cubit<GetAzkarState> {
  GetAzkarCubit() : super(GetAzkarInitial());

  Future<void> getAzkar()async{
    final List<DoaaModel> doaaList = [];
    emit(GetAzkarLoading());
    try {
      List<DoaaModel> azkar = await GetDoaa().getDoaa();
      for (var doaa in azkar) {
        doaaList.add(doaa);
    print('Category: ${doaa.category}');
    print('Content: ${doaa.content}');
    print('Count: ${doaa.count}');
    print('Description: ${doaa.description}');
    print('----------');
  }
      emit(GetAzkarSucess(azkar: doaaList));
      
    } catch (e) {
     emit(GetAzkarFailure(errorMessage: e.toString()));
      
    }
  }
}
