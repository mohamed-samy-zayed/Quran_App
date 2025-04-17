import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/constants.dart';
import 'package:quran_app/features/Auth/presentation/manager/Auth_cubit/auth_cubit.dart';
import 'package:quran_app/core/utils/show_dialog.dart';
import 'package:quran_app/core/utils/show_snackbar.dart';
import 'package:quran_app/features/Auth/presentation/views/Login_page.dart';
import 'package:quran_app/core/utils/widgets/custom_button.dart';
import 'package:quran_app/features/Auth/presentation/views/widgets/custom_textField.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});
  static String id = 'SignupPage';
  String? user, email, password, confirmPassword;
  GlobalKey<FormState> formState = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is SignUpSucess) {
            Navigator.pop(context);
            emailVerified(context);
          } else if (state is SignUpFailure) {
            Navigator.of(context).pop();
            ShowSnackBar(context, message: state.errorMessage);
          } else {
            showDialogLoading(context,text: 'من فضلك انتظر');
          }
        },
        builder: (context, state) {
          return Form(
            key: formState,
            child: ListView(
              padding: const EdgeInsets.only(
                top: 60,
                right: 20,
                left: 20,
                bottom: 20,
              ),
              children: [
                Column(
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
                      'حساب جديد',
                      style: TextStyle(
                        color: kTitleColor,
                        fontSize: 40,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'اسم المستخدم',
                      style: TextStyle(
                        color: kTitleColor,
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    CustomTextField(
                      hintText: 'ادخل اسم المستخدم',
                      secure: false,
                      validator: (p0) {
                        if (p0 == null || p0.isEmpty) {
                          return 'من فضلك ادخل اسم المستخدم';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      onChanged: (p0) {
                        user = p0;
                      },
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'البريد الالكتروني',
                      style: TextStyle(
                        color: kTitleColor,
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
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
                        }
                        return null;
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
                        fontWeight: FontWeight.w900,
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
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'تاكيد كلمة المرور ',
                      style: TextStyle(
                        color: kTitleColor,
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    CustomTextField(
                      hintText: 'ادخل تاكيد كلمة المرور',
                      secure: true,
                      validator: (p0) {
                        if (p0 == null || p0.isEmpty) {
                          return 'من فضلك ادخل تاكيد كلمة المرور';
                        } else if (p0 != password) {
                          return 'كلمة المرور لا تتشابه مع تاكيد كبمة المرور';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.visiblePassword,
                      onChanged: (p0) {
                        confirmPassword = p0;
                      },
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        textDirection: TextDirection.rtl,
                        children: [
                          Text(
                            ' هل لديك لديك حساب ؟',
                            style: TextStyle(
                              color: kTextColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacementNamed(
                                  context, LoginPage.id);
                            },
                            child: Text(
                              'تسجيل دخول ',
                              style: TextStyle(
                                color: kTitleColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Center(
                      child: CustomButton(
                        title: 'انشاء حساب',
                        pushNamed: () {
                          if (formState.currentState!.validate()) {
                            BlocProvider.of<AuthCubit>(context)
                                .SignUser(email: email!, password: password!);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void emailVerified(BuildContext context) {
    FirebaseAuth.instance.currentUser!.sendEmailVerification();
    ShowSnackBar(context, message: 'من فضلك اذهب للبريد الالكتروني للتحقق');
    Navigator.pushReplacementNamed(context, LoginPage.id);
  }
}
