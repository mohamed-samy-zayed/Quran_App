import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'numberlength_state.dart';

class NumberlengthCubit extends Cubit<NumberlengthState> {
  NumberlengthCubit() : super(Numberlength13(number: 13));


 void numberLength(int number) {
    if(number < 10){
      emit(Numberlength13(number: 13));
      
    }
  else{
    emit(Numberlength10(number: 10));
    
  }}
  
}
