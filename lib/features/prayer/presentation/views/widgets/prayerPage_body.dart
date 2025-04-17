import 'package:flutter/material.dart';
import 'package:quran_app/constants.dart';
import 'package:quran_app/features/prayer/presentation/views/widgets/prayer-time.dart';

class PrayerBody extends StatelessWidget {
  const PrayerBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: WaveClipper(),
      child: Container(
        decoration: BoxDecoration(color: kTGradientColor),
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                ClipRRect(
                  child: Image.asset(
                    'assets/image/prayer.png',
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fitHeight,
                    height: 350,
                  ),
                ),
                Positioned(
                  top: 310,
                  right: 50,
                  child: Container(
                    height: 60,
                    width: 300,
                    decoration: BoxDecoration(
                        color: kContainerColor,
                        borderRadius: BorderRadius.circular(10),
                        shape: BoxShape.rectangle),
                    child: Row(
                      children: [
                        const Spacer(
                          flex: 1,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.arrow_back_ios_rounded)),
                        const Spacer(
                          flex: 2,
                        ),
                        const Text(
                          '20 April 2024',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        const Spacer(
                          flex: 2,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.arrow_forward_ios_rounded)),
                        const Spacer(
                          flex: 1,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                    top: 35,
                    right: 30,
                    child: Text(
                      'مواقيت الصلاة',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 39,
                        color: kTitleColor,
                      ),
                    )),
                Positioned(
                    top: 250,
                    right: 110,
                    child: Text(
                      'إن ما يميز المؤمنين عن الكفار هو\n    المحافظة على الصلاة',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 20,
                        color: Colors.grey[300],
                      ),
                    )),
                const Positioned(
                    top: 200,
                    right: 110,
                    child: Text(
                      'AM 4:45   الفَجر',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 35,
                        color: Colors.white,
                      ),
                    )),
                const Positioned(
                    top: 35,
                    left: 15,
                    child: Text(
                      'باقي من الزمن\n -1:38:09',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    )),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            const PrayerTime(
              icon: 'assets/image/fajr.png',
              name: 'الفجر',
              time: '4:45',
            ),
            const PrayerTime(
              icon: 'assets/image/duhr.png',
              name: 'الظهر',
              time: '12:49',
            ),
            const PrayerTime(
              icon: 'assets/image/duhr.png',
              name: 'العصر',
              time: '4:23',
            ),
            const PrayerTime(
              icon: 'assets/image/maghreb.png',
              name: 'المغرب',
              time: '6:35',
            ),
            const PrayerTime(
              icon: 'assets/image/isha.png',
              name: 'العشاء',
              time: '8:10',
            ),
          ],
        ),
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    // Start from the top-left
    path.lineTo(0, size.height - 18); // Lower the starting line

    // First curve
    path.quadraticBezierTo(
      size.width / 4, // Control point X
      size.height + 18, // Control point Y (lowered)
      size.width / 2, // End point X
      size.height - 18, // End point Y (lowered)
    );

    // Second curve
    path.quadraticBezierTo(
      3 * size.width / 4, // Control point X
      size.height - 58, // Control point Y (lowered more)
      size.width, // End point X
      size.height - 8, // End point Y (lowered)
    );

    // Draw straight line to the top-right corner
    path.lineTo(size.width, 0);

    // Close the path
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
