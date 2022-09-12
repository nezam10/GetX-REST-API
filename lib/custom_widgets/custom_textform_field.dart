import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextformField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final bool obscureText;
  final Function(String?)? onSaved;
  final String? labelText;
  String? errorText;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Widget? label;
  final TextStyle? style;
  final Color? color;
  final double? width;
  final double? height;
  final Decoration? decoration;
  final int? maxLength;
  final int? maxLines;
  final TextAlign textAlign;
  final EdgeInsetsGeometry? padding;
  final void Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  CustomTextformField({
    Key? key,
    this.controller,
    this.keyboardType,
    this.validator,
    this.obscureText = false,
    this.labelText,
    this.errorText,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.label,
    this.onSaved,
    this.style,
    this.color,
    this.width,
    this.height,
    this.decoration,
    this.maxLength,
    this.maxLines,
    required this.textAlign,
    this.padding,
    this.onChanged,
    this.inputFormatters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      color: color,
      alignment: Alignment.center,
      decoration: decoration,
      padding: padding,
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        validator: validator,
        obscureText: obscureText,
        onSaved: onSaved,
        style: style,
        maxLength: maxLength,
        maxLines: maxLines,
        textAlign: textAlign,
        onChanged: onChanged,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: labelText,
          errorText: errorText,
          hintText: hintText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          fillColor: Colors.grey,
          //filled: true,
          label: label,
          labelStyle: TextStyle(color: Colors.black),
          hintStyle: TextStyle(color: Color(0xFF9A9A9A)),
        ),
      ),
    );
  }
}
