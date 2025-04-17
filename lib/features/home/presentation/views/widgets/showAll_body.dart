import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/features/home/presentation/manager/search_soura_cubit/search_soura_cubit.dart';
import 'package:quran_app/features/home/presentation/views/widgets/search_souraListview.dart';
import 'package:quran_app/features/home/presentation/views/widgets/search_textField.dart';
import 'package:quran_app/features/home/presentation/views/widgets/showAll_appbar.dart';

class ShowallBody extends StatelessWidget {
  const ShowallBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20,top: 30),
      child: Column(
        spacing: 20,
        children: [
         const ShowallAppbar(),
           SizedBox(
            height: 60,
             child: SearchTextfield(onSubmitted: (q){
              
              BlocProvider.of<SearchSouraCubit>(context).filterSoura(name: q);
             }),
           ),

         const SearchSouraListview()
        ],
      ),
    );
  }
}
