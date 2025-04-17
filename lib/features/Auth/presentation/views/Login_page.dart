import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/constants.dart';
import 'package:quran_app/features/Auth/presentation/manager/Auth_cubit/auth_cubit.dart';
import 'package:quran_app/features/home/presentation/manager/getsurah_cubit/getsurah_cubit_cubit.dart';
import 'package:quran_app/core/utils/show_dialog.dart';
import 'package:quran_app/core/utils/show_snackbar.dart';
import 'package:quran_app/features/home/presentation/views/home_page.dart';
import 'package:quran_app/features/Auth/presentation/views/signUp_page.dart';
import 'package:quran_app/features/Auth/presentation/views/widgets/LoginWith_google.dart';
import 'package:quran_app/core/utils/widgets/custom_button.dart';
import 'package:quran_app/features/Auth/presentation/views/widgets/custom_textField.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  static String id = 'LoginPage';
  String? email, password;
  GlobalKey<FormState> formState = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is LoginSucess) {
            Navigator.pop(context);
            checkVerifcation(context,credential: state.credential);
            BlocProvider.of<GetsurahCubitCubit>(context).getSurah();
           
          } else if (state is LoginFailure) {
            Navigator.pop(context);
            ShowSnackBar(context, message: state.errorMessage);
          } else {
            showDialogLoading(context,text: 'من فضلك انتظر');
          }
        },
        builder: (context, state) {
          return Form(
            key: formState,
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20, top: 15),
                  child: Column(
                    textDirection: TextDirection.rtl,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Image.asset(
                          'assets/image/logo.png',
                          height: 140,
                          width: 140,
                          filterQuality: FilterQuality.high,
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                        ),
                      ),
                      Text(
                        'تسجيل الدخول',
                        style: TextStyle(
                          color: kTitleColor,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'سجل الان لاستخدام التطبيق مجانا',
                        style: TextStyle(
                          color: kTextColor,
                          fontSize: 28,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'البريد الالكتروني',
                        style: TextStyle(
                          color: kTitleColor,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      CustomTextField(
                        hintText: 'ادخل البريد الالكتروني',
                        secure: false,
                        validator: (p0) {
                          if (p0 == null || p0.isEmpty) {
                            return 'من فضلك ادخل البريد الالكتروني';
                          } return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (p0) {
                          email = p0;
                        },
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'كلمة المرور ',
                        style: TextStyle(
                          color: kTitleColor,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CustomTextField(
                        hintText: 'ادخل كلمة المرور',
                        secure: true,
                        validator: (p0) {
                          if (p0 == null || p0.isEmpty) {
                            return 'من فضلك ادخل كلمة المرور';
                          } 
                            return null;
                          
                        },
                        keyboardType: TextInputType.visiblePassword,
                        onChanged: (p0) {
                          password = p0;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        textDirection: TextDirection.rtl,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Spacer(
                            flex: 1,
                          ),
                          Text(
                            'هل نسيت كلمة المرور ؟',
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Column(
                          children: [
                            Text(
                              ':او التسجيل عن طريق',
                              style: TextStyle(
                                color: kTextColor,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                           const LoginWithGoogle(),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              textDirection: TextDirection.rtl,
                              children: [
                                Text(
                                  ' ليس لديك حساب ؟',
                                  style: TextStyle(
                                    color: kTextColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacementNamed(
                                        context, SignupPage.id);
                                  },
                                  child: Text(
                                    'حساب جديد ',
                                    style: TextStyle(
                                      color: kTitleColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            CustomButton(
                              title: ' تسجيل دخول',
                              pushNamed: () {
                                
                                  if (formState.currentState!.validate()) {
  BlocProvider.of<AuthCubit>(context).loginUser(
  
      email: email!, password: password!);
}
                                
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void checkVerifcation(BuildContext context,{required UserCredential credential }){
    if(credential.user!.emailVerified == true){
       Navigator.pushReplacementNamed(context, HomePage.id);
    }else{
      ShowSnackBar(context, message: '!لم يتم التحقق \n من فضلك اذهب للبريد الالكتروني للتحقق');
    }
  }
}