import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String? hintText;
  final bool obscureText, readOnly;
  final TextEditingController? controller;
  final IconData? suffixIcon;
  final TextInputType? textInputType;
  final int? maxLength;
  final void Function()? actionIcon;
  final action;
  final VoidCallback? onTap;
  final FocusNode? focusNode;
  final void Function()? onEditingComplete;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization? textCapitalization;
  final FieldValidator? validator;

  const TextFormFieldWidget(
      {Key? key,
      this.hintText,
      this.controller,
      this.suffixIcon,
      this.textInputType = TextInputType.text,
      this.obscureText = false,
      this.maxLength,
      this.action,
      this.readOnly = false,
      this.actionIcon,
      this.focusNode,
      this.onEditingComplete,
      this.textInputAction,
      this.inputFormatters,
      this.textCapitalization = TextCapitalization.none,
      this.validator,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textCapitalization: textCapitalization!,
      readOnly: readOnly,
      textInputAction: textInputAction,
      obscureText: obscureText,
      maxLength: maxLength,
      focusNode: focusNode,
      validator: validator!,
      controller: controller,
      keyboardType: textInputType,
      inputFormatters: inputFormatters,
      onChanged: action,
      onTap: onTap,
      onEditingComplete: onEditingComplete,
      decoration: InputDecoration(
          counterText: "",
          labelText: hintText,
          suffixIcon: IconButton(
              icon: Icon(
                suffixIcon,
                color: Theme.of(context).iconTheme.color,
              ),
              onPressed: actionIcon),
          labelStyle: TextStyle(color: Colors.grey, fontSize: 15.sp),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7.sp),
              borderSide: BorderSide(color: Colors.red)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7.sp),
              borderSide: BorderSide(color: Colors.grey)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7.sp),
              borderSide: BorderSide(color: Colors.grey)),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.grey))),
    );
  }
}
