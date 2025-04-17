import 'package:flutter/material.dart';
import 'package:quran_app/constants.dart';

class ReaderGridView extends StatelessWidget {
  const ReaderGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GridView.builder(
      padding: const EdgeInsets.only(top: 0),
      itemCount: 10,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) {
        return const ItemReading();
      },
    ));
  }
}

class ItemReading extends StatelessWidget {
  const ItemReading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, bottom: 20),
      child: SizedBox(
        height: 150,
        width: 150,
        child: Card(
          elevation: 10,
          color: kBackgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/image/مشاري.png',
                      width: MediaQuery.of(context).size.width,
                      height: 95,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                      bottom: -10,
                      right: 2,
                      child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              color: kTextColor, shape: BoxShape.circle),
                          child: const Icon(
                            Icons.play_arrow_rounded,
                            color: Colors.white,
                            size: 25,
                          )))
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'مشاري راشد',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const Text(
                'رواية حفص عن عاصم',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                    color: Colors.grey),
              )
            ],
          ),
        ),
      ),
    );
  }
}
