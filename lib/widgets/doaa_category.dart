import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/cubits/getAzkar_cubit/get_azkar_cubit.dart';
import 'package:quran_app/widgets/tile_category.dart';

class DoaaCategory extends StatelessWidget {
  const DoaaCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAzkarCubit, GetAzkarState>(
      builder: (context, state) {
        if (state is GetAzkarSucess) {
  return Expanded(
      child: ListView.builder(
    itemCount: state.azkar.length,
    padding: const EdgeInsets.only(left: 20, bottom: 15),
    itemBuilder: (context, index) {
      return TileCategory(
        count: state.azkar[index].count,
        description: state.azkar[index].content,
        name: state.azkar[index].category,
        number: index + 1,
        type: state.azkar[index].description,
      );
    },
  ));
}else{
  return SizedBox();
}
      },
    );
  }
}
