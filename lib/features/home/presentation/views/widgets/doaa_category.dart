import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/features/home/presentation/manager/getAzkar_cubit/get_azkar_cubit.dart';
import 'package:quran_app/features/home/presentation/views/widgets/soura_item.dart';

class DoaaCategory extends StatelessWidget {
  const DoaaCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAzkarCubit, GetAzkarState>(
      builder: (context, state) {
        if (state is GetAzkarSucess) {
  return SliverPadding(
    padding: const EdgeInsets.only(left: 20, bottom: 15),
     sliver: SliverList.builder(
        
    itemCount: state.azkar.length,
    
    itemBuilder: (context, index) {
      return SouraItem(
        count: state.azkar[index].count,
        description: state.azkar[index].content,
        name: state.azkar[index].category,
        number: index + 1,
        type: state.azkar[index].description,
      );
    },
  ));
}else{
  return const SliverToBoxAdapter(child: SizedBox());
}
      },
    );
  }
}
