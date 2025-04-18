import 'package:fakrni/core/styles/app_colors.dart';
import 'package:fakrni/core/styles/text_styles.dart';
import 'package:flutter/material.dart';

class TextformfieldInAuth extends StatelessWidget {
  const TextformfieldInAuth({super.key, this.hintText, this.keyboardType, this.controller, this.validator});
  final String? hintText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.mainColor,
        hintText: hintText,
        hintStyle: TextStyles.fakrnitext.copyWith(
          fontSize: 14,
          color: AppColors.textColor.withOpacity(0.5),
        ),
        
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}