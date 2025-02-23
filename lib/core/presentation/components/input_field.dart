import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isPassword;
  final Widget? suffixIcon;

  const InputField({
    super.key,
    required this.hintText,
    required this.controller,
    this.isPassword = false,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    return SizedBox(
      height: 48,
      child: TextField(
        controller: controller,
        style: textTheme.bodyLarge?.copyWith(
          color: colorScheme.primary,
        ),
        maxLines: 1,
        obscureText: isPassword,
        decoration: InputDecoration(
          isDense: true,
          hintText: hintText,
          hintStyle: textTheme.bodyLarge?.copyWith(
            color: colorScheme.secondary,
          ),
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
