import 'package:flutter/material.dart';
import 'package:quran_app/constants.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.secure,
    required this.hintText,
    required this.keyboardType,
    required this.onChanged,
    required this.validator,
  });
  final bool secure;
  final String hintText;
  final TextInputType keyboardType;
  final Function(String) onChanged;
  final String? Function(String?)? validator;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isSelected = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      cursorHeight: 20,
      style: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w500,
      ),
      keyboardType: widget.keyboardType,
      textDirection: TextDirection.rtl,
      obscuringCharacter: '•',
      onChanged: widget.onChanged,
      obscureText: isSelected == false ? false : widget.secure,
      cursorColor: kTitleColor,
      decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.only(top: 10, bottom: 10, right: 20, left: 10),
          hintTextDirection: TextDirection.rtl,
          hintStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
          hintText: widget.hintText,
          prefixIcon: widget.secure == false
              ? null
              : IconButton(
                  onPressed: () {
                    setState(() {
                      isSelected = !isSelected;
                    });
                  },
                  icon: returnPasswordIcon(),
                ),
          fillColor: Colors.grey[200],
          filled: true,
          errorStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
          hoverColor: Colors.grey[200],
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: kTitleColor,
              )),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: kTitleColor,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: kTitleColor,
              )),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: kTitleColor,
              ))),
    );
  }

  Icon returnPasswordIcon() {
    if (isSelected == true) {
      return Icon(
        Icons.visibility_off_rounded,
        color: kTitleColor,
      );
    }
    return Icon(
      Icons.remove_red_eye_rounded,
      color: kTitleColor,
    );
  }
}
