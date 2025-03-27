import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/constants.dart';
import 'package:quran_app/cubits/Auth/auth_cubit.dart';
import 'package:quran_app/cubits/categories_cubit/categories_cubit.dart';
import 'package:quran_app/cubits/getAzkar_cubit/get_azkar_cubit.dart';
import 'package:quran_app/cubits/getsurah_cubit/getsurah_cubit_cubit.dart';
import 'package:quran_app/cubits/numberLength_cubit/numberlength_cubit.dart';
import 'package:quran_app/pages/Login_page.dart';
import 'package:quran_app/pages/home_page.dart';
import 'package:quran_app/pages/prayer_page.dart';
import 'package:quran_app/pages/profile_page.dart';
import 'package:quran_app/pages/reading_page.dart';
import 'package:quran_app/pages/signUp_page.dart';
import 'package:quran_app/pages/splash_page.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(DevicePreview(
      enabled: !kReleaseMode, builder: (context) => const QuranApp()));
}

class QuranApp extends StatelessWidget {
  const QuranApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => CategoriesCubit(),)
      ,BlocProvider(create: (context) => AuthCubit(),),
      BlocProvider(create: (context) => NumberlengthCubit(),),
      BlocProvider(create: (context) => GetsurahCubitCubit(),),
      BlocProvider(create: (context) => GetAzkarCubit(),)],
     
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        title: 'Quran ',
        theme: ThemeData(
          fontFamily: 'Lateef',
          appBarTheme: AppBarTheme(
            backgroundColor: kBackgroundColor,
          ),
          scaffoldBackgroundColor: kBackgroundColor,
          useMaterial3: false,
        ),
        routes: {
          SplashPage.id: (context) => const SplashPage(),
          HomePage.id: (context) => const HomePage(),
          PrayerPage.id: (context) => const PrayerPage(),
          ReadingPage.id: (context) => const ReadingPage(),
          ProfilePage.id:(context) => const  ProfilePage(),
          LoginPage.id :(context) =>  LoginPage(), 
          SignupPage.id: (context) =>  SignupPage(),
        },
        initialRoute: SplashPage.id,
      ),
    );
  }
}
