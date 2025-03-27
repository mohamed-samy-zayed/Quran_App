import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  
  Future<void> loginUser(
      {required String email, required String password}) async {
    emit(LoginLoading());
    try {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(LoginSucess(
        credential: credential
      ));
      
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'wrong-password')  {
        emit(LoginFailure(errorMessage: 'كلمة المرور خاطئة'));
    
      } else if (ex.code == 'user-not-found') {
        emit(LoginFailure(errorMessage:'لا يوجد حساب' ));
       
      }
    } catch (e) {
      emit(LoginFailure(
          errorMessage: 'هناك خطا \n !حاول مجددا'));
         
    }
  }

  Future<void> SignUser(
      {required String email, required String password}) async {
    emit(SignUpLoading());
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(SignUpSucess());
    } on FirebaseAuthException catch (ex) {
       if (ex.code == 'weak-password') {
        emit(SignUpFailure(errorMessage: 'كلمة المرور ضعيفة'));
      } else if (ex.code == 'email-already-in-use') {
        emit(SignUpFailure(errorMessage: 'هذا الحساب موجود بالفعل'));
      }
    } catch (ex) {
      emit(SignUpFailure(errorMessage: 'هناك خطا \n !حاول مجددا'));
    }
  }

  @override
  void onChange(Change<AuthState> change) {
    
    super.onChange(change);

    print(change);
  }
}
