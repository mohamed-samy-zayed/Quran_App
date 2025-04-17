
import 'package:flutter/material.dart';
import 'package:quran_app/features/home/presentation/views/widgets/soura_item.dart';

class HadethCategory extends StatelessWidget {
  const HadethCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(left: 20, bottom: 15),
        sliver: SliverList.builder(
      itemCount: 10,
      
      itemBuilder: (context, index) {
        return  SouraItem(
          count: '',
          description: 'قال رسول الله صلي الله عليه وسلم امك ثم امك ثم امك ثم ابوك',
          name: '',
          number: index + 1,
          type: '',
        );
      },
    ));
    
  }
}
