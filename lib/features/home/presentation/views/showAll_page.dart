import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/features/home/presentation/manager/search_soura_cubit/search_soura_cubit.dart';
import 'package:quran_app/features/home/presentation/views/widgets/showAll_body.dart';

class ShowallPage extends StatelessWidget {
  const ShowallPage({super.key});
  static String id = 'ShowallPage';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchSouraCubit()..filterSoura(),
      child: const Scaffold(
        body: ShowallBody(),
      ),
    );
  }
}
