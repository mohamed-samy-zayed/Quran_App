import 'package:flutter/material.dart';
import 'package:quran_app/constants.dart';
import 'package:quran_app/widgets/reading_gridview.dart';

class ReadingPageBody extends StatelessWidget {
  const ReadingPageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 20),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            textDirection: TextDirection.rtl,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                textDirection: TextDirection.rtl,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'قائمة القراء',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                      color: kTitleColor,
                    ),
                  ),
                  Text(
                    'وإذا قرأ القرآن فاستمعوا له',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: kTextColor,
                    ),
                  ),
                  const Text(
                    '10:21',
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 45,
                        fontFamily: 'Poppins'),
                  ),
                  Text(
                    'رمضان   23/1444',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 22,
                      color: kTextColor,
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 140,
                    decoration: BoxDecoration(
                      color: kTitleColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        'AM فَجر  4:17 ',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: ClipRRect(
                  child: Image.asset(
                    'assets/image/listening.png',
                    filterQuality: FilterQuality.low,
                    fit: BoxFit.fill,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          const ReadingGridView()
        ],
      ),
    );
  }
}
