
import 'package:flutter/material.dart';
import 'package:quran_app/constants.dart';

class TitleCategory extends StatelessWidget {
  const TitleCategory({
    super.key, required this.onTap, required this.top, required this.right, required this.image, required this.title, required this.height, required this.width, required this.color, 
  });
 final void Function()? onTap;
 
 final double top ,right,height,width;
 final String image,title;
 final Color color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 10,
        color: kBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          height: 60,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: color,
            shape: BoxShape.rectangle,
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: top,
                right:right,
                child: ClipRRect(
                  child: Image.asset(
                    image,
                    filterQuality: FilterQuality.low,
                    height: height,
                    width: width,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                 title ,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w800,
                    color: kTitleColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
