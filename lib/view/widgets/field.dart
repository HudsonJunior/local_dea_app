import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:local_dea_app/definitions/colors.dart';

class CustomFormField extends StatelessWidget {
  final IconData icon;
  final String label;
  final String? hintText;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final bool isRequired;
  final ValueGetter<String?>? validator;
  final List<MaskTextInputFormatter>? formatters;
  final bool obscureText;
  final IconData? suffixIcon;
  final VoidCallback? onTapSuffixIcon;

  const CustomFormField({
    Key? key,
    required this.icon,
    required this.label,
    required this.controller,
    this.isRequired = true,
    this.keyboardType,
    this.suffixIcon,
    this.hintText,
    this.onTapSuffixIcon,
    this.obscureText = false,
    this.validator,
    this.formatters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (label.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                label,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        const SizedBox(height: 4.0),
        TextFormField(
          keyboardType: keyboardType,
          inputFormatters: formatters,
          obscureText: obscureText,
          style: const TextStyle(
            color: Palette.primary,
            fontWeight: FontWeight.w700,
          ),
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: Palette.primary),
            suffixIcon: suffixIcon != null
                ? IconButton(
                    icon: Icon(suffixIcon, color: Palette.primary),
                    onPressed: onTapSuffixIcon,
                  )
                : const SizedBox.shrink(),
            fillColor: Colors.grey[200],
            filled: true,
            errorStyle: const TextStyle(color: Colors.white),
            errorMaxLines: 2,
            prefixIcon: Icon(
              icon,
              color: Palette.primary,
            ),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            floatingLabelStyle: const TextStyle(
              fontSize: 16.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(18.0),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(18.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(18.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(18.0),
            ),
          ),
          validator: (text) {
            if ((text?.isEmpty ?? true) && isRequired) {
              return 'Campo obrigatório!';
            }
            if (validator != null) return validator!();
            return null;
          },
        ),
      ],
    );
  }
}