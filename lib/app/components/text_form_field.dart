import 'package:flutter/material.dart';

import '../utils/color.dart';

const OutlineInputBorder ENABLED_BORDER = OutlineInputBorder(
  borderSide: BorderSide(width: 1, color: ENABLED_BORDER_COLOR),
);
const OutlineInputBorder FOCUSED_BORDER = OutlineInputBorder(
  borderSide: BorderSide(width: 1, color: FOCUSED_BORDER_COLOR),
);
const OutlineInputBorder ERROR_BORDER = OutlineInputBorder(
  borderSide: BorderSide(width: 1, color: ERROR_BORDER_COLOR),
);
const OutlineInputBorder FOCUSED_ERROR_BORDER = OutlineInputBorder(
  borderSide: BorderSide(width: 1, color: FOCUSED_ERROR_BORDER_COLOR),
);

class PrimaryTextFormField extends StatelessWidget {
  const PrimaryTextFormField(
      {Key? key,
      this.label,
      this.validationText,
      this.controller,
      this.suffixIconButton,
      this.prefixIcon,
      this.prefixIconColor,
      this.textInputType,
      required this.obscureText})
      : super(key: key);

  final String? label;
  final String? validationText;
  final TextEditingController? controller;
  final IconButton? suffixIconButton;
  final IconData? prefixIcon;
  final Color? prefixIconColor;
  final bool obscureText;
  final TextInputType? textInputType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: Icon(
          prefixIcon,
          color: prefixIconColor,
        ),
        suffixIcon: suffixIconButton,
        label: Text(label ?? ''),
        enabledBorder: ENABLED_BORDER,
        focusedBorder: FOCUSED_BORDER,
        errorBorder: ERROR_BORDER,
        focusedErrorBorder: FOCUSED_ERROR_BORDER,
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return validationText;
        } else {
          return null;
        }
      },
    );
  }
}
