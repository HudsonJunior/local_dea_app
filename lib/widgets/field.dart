import 'package:flutter/material.dart';
import 'package:local_dea_app/constraints/colors.dart';

class CustomFormField extends StatelessWidget {
  final IconData icon;
  final String label;
  final TextEditingController controller;

  const CustomFormField({
    Key? key,
    required this.icon,
    required this.label,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Colors.white),
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: Palette.secondary,
        ),
        label: Text(
          label,
          style: const TextStyle(
            fontSize: 20.0,
          ),
        ),
        labelStyle: const TextStyle(
          fontSize: 16.0,
          color: Colors.white,
          fontWeight: FontWeight.w500,
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
    );
  }
}
