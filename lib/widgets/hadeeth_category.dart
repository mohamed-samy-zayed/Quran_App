
import 'package:flutter/material.dart';
import 'package:quran_app/widgets/tile_category.dart';

class HadethCategory extends StatelessWidget {
  const HadethCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      itemCount: 10,
      padding: const EdgeInsets.only(left: 20, bottom: 15),
      itemBuilder: (context, index) {
        return  TileCategory(
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
