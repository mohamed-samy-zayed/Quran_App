import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesIndex1());

  void GetCategories({
    required bool index1Selected,
    required bool index2Selected,
    required bool index3Selected,
  }) {
    
    if (index1Selected == true) {
       index1Selected = !index1Selected;
      index2Selected = false;
      index3Selected = false;
      emit(CategoriesIndex1());
    } else if (index2Selected == true) {
       index2Selected = !index2Selected;
      index1Selected = false;
      index3Selected = false;
      emit(CategoriesIndex2());
    } else if (index3Selected == true) {
       index3Selected = !index3Selected;
      index1Selected = false;
      index2Selected = false;
      emit(CategoriesIndex3l());
    }
  }
}
