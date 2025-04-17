import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/constants.dart';
import 'package:quran_app/features/Auth/presentation/manager/Auth_cubit/auth_cubit.dart';
import 'package:quran_app/features/home/presentation/manager/categories_cubit/categories_cubit.dart';
import 'package:quran_app/features/home/presentation/manager/getAzkar_cubit/get_azkar_cubit.dart';
import 'package:quran_app/features/home/presentation/manager/getsurah_cubit/getsurah_cubit_cubit.dart';
import 'package:quran_app/features/home/presentation/manager/numberLength_cubit/numberlength_cubit.dart';
import 'package:quran_app/features/Auth/presentation/views/Login_page.dart';
import 'package:quran_app/features/home/presentation/views/details_page.dart';
import 'package:quran_app/features/home/presentation/views/home_page.dart';
import 'package:quran_app/features/home/presentation/views/showAll_page.dart';
import 'package:quran_app/features/prayer/presentation/views/prayer_page.dart';
import 'package:quran_app/features/profile/presentation/views/profile_page.dart';
import 'package:quran_app/features/reader/presentation/views/reader_page.dart';
import 'package:quran_app/features/Auth/presentation/views/signUp_page.dart';
import 'package:quran_app/features/splah/presentation/views/splash_page.dart';
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
          ReaderPage.id: (context) => const ReaderPage(),
          ProfilePage.id:(context) => const  ProfilePage(),
          LoginPage.id :(context) =>  LoginPage(), 
          SignupPage.id: (context) =>  SignupPage(),
          DetailsPage.id: (context)=> const DetailsPage(),
          ShowallPage.id : (context)=> const ShowallPage(),
        },
        initialRoute: HomePage.id,
      ),
    );
  }
   String checkUser(){
     if (FirebaseAuth.instance.currentUser == null || FirebaseAuth.instance.currentUser!.emailVerified == false){
            return   SplashPage.id;
            }else{
             return  HomePage.id;
            }

  }
}
