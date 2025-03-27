import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/constants.dart';
import 'package:quran_app/cubits/numberLength_cubit/numberlength_cubit.dart';

class TileCategory extends StatelessWidget {
  const TileCategory({
    super.key,
    required this.name,
    required this.description,
    required this.count,
    required this.type,
    required this.number,
  });

  final String name, description, count, type;
  final int number;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<NumberlengthCubit>(context).numberLength(number);
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          Expanded(
            child: Card(
              elevation: 10,
              color: kBackgroundColor,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                  bottomLeft: Radius.circular(5),
                  topLeft: Radius.circular(5),
                ),
              ),
              child: ListTile(
                onTap: () {},
                contentPadding: const EdgeInsets.all(10),
                minVerticalPadding: 5,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                    bottomLeft: Radius.circular(5),
                    topLeft: Radius.circular(5),
                  ),
                ),
                trailing: name != ''
                    ? Text(
                        name,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w800,
                          color: kTitleColor,
                        ),
                      )
                    : null,
                title: Text(
                  description,
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.right,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                titleTextStyle: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 17,
                  color: kTitleColor,
                ),
                subtitle: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      type,
                      style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w600,
                          color: kTextColor),
                    ),
                    const SizedBox(
                      width: 45,
                    ),
                    Text(
                      count,
                      style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w600,
                          color: kTextColor),
                    ),
                  ],
                ),
                leading: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Stack(
                    children: [
                      ClipRRect(
                        child: Image.asset(
                          'assets/image/count.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                      BlocBuilder<NumberlengthCubit, NumberlengthState>(
                        builder: (context, state) {
                          if (state is Numberlength13) {
                            return Positioned(
                                top: 1,
                                right: state.number.toDouble(),
                                child: Text( number == 0 ? '*':
                                  '$number',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ));
                          } else if (state is Numberlength10) {
                            return Positioned(
                                top: 1,
                                right: state.number.toDouble(),
                                child: Text(
                                  '$number',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ));
                          } else {
                            return const SizedBox();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 132,
            width: 13,
            decoration: BoxDecoration(
              color: kTitleColor,
              borderRadius: BorderRadius.circular(5),
              shape: BoxShape.rectangle,
            ),
          )
        ],
      ),
    );
  }
}
