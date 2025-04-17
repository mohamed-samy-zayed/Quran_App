import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/constants.dart';
import 'package:quran_app/features/home/presentation/manager/search_soura_cubit/search_soura_cubit.dart';

class SearchTextfield extends StatefulWidget {
  const SearchTextfield({super.key, required this.onSubmitted});
  final Function(String) onSubmitted;

  @override
  State<SearchTextfield> createState() => _SearchTextfieldState();
}

class _SearchTextfieldState extends State<SearchTextfield> {
  TextEditingController controller = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.search,
      onSubmitted: widget.onSubmitted,
      textDirection: TextDirection.rtl,
      showCursor: true,
      cursorColor: kTitleColor,
      // autofillHints: AutofillHints.name,
      style: const TextStyle(
        fontWeight: FontWeight.w800,
        fontSize: 26,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: kBackgroundColor,
        prefix: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: IconButton(
            onPressed: () {
              controller.clear();
              BlocProvider.of<SearchSouraCubit>(context).filterSoura();
            },
            icon: Icon(
              Icons.clear_all_rounded,
              color: kTitleColor,
            ),
          ),
        ),
        suffixIcon: Icon(
          Icons.search,
          color: kTitleColor,
          weight: 10,
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: kTitleColor, width: 2.5)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: kTitleColor, width: 2.5)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: kTitleColor, width: 2.5)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: kTitleColor, width: 2.5)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: kTitleColor, width: 2.5)),
        hintText: "البحث...",
        hintTextDirection: TextDirection.rtl,
        hintStyle: GoogleFonts.amiriQuran().copyWith(
          fontSize: 20,
          fontWeight: FontWeight.w900,
          color: kTitleColor,
        ),
        errorStyle: GoogleFonts.amiriQuran().copyWith(fontWeight: FontWeight.w800, color: kTitleColor),
      ),
    );
  }
}
