// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

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
  final bool hasUnderlineBorder;

  const CustomFormField({
    Key? key,
    required this.icon,
    required this.label,
    this.hintText,
    required this.controller,
    this.keyboardType,
    this.isRequired = true,
    this.validator,
    this.formatters,
    this.obscureText = false,
    this.suffixIcon,
    this.onTapSuffixIcon,
    this.hasUnderlineBorder = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (label.isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                label,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        const SizedBox(height: 4.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: TextFormField(
            keyboardType: keyboardType,
            inputFormatters: formatters,
            obscureText: obscureText,
            cursorColor: Colors.black,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(color: Colors.black),
              suffixIcon: suffixIcon != null
                  ? IconButton(
                      splashColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      icon: Icon(
                        suffixIcon,
                        color: Colors.black,
                      ),
                      onPressed: onTapSuffixIcon,
                    )
                  : null,
              fillColor: Colors.white,
              filled: true,
              errorStyle: const TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.w600,
              ),
              errorMaxLines: 2,
              prefixIcon: Icon(
                icon,
                color: Colors.black,
              ),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              floatingLabelStyle: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(
                    color:
                        hasUnderlineBorder ? Colors.black : Colors.transparent),
              ),
              disabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color:
                        hasUnderlineBorder ? Colors.black : Colors.transparent),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color:
                        hasUnderlineBorder ? Colors.black : Colors.transparent),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color:
                        hasUnderlineBorder ? Colors.black : Colors.transparent),
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
        ),
      ],
    );
  }
}
