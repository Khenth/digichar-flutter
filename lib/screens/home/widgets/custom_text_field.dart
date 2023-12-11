import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String? label;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final bool? obscureText;
  final bool? enabled;
  final String? hintText;
  final String? errorMessage;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final String? Function(String? value)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final String? initialValue;
  final int? maxLines;
  const CustomTextField(
      {super.key,
      this.label,
      this.validator,
      this.prefixIcon,
      this.suffixIcon,
      this.obscureText,
      this.enabled,
      this.hintText,
      this.errorMessage,
      this.onChanged,
      this.onFieldSubmitted,
      this.keyboardType,
      this.inputFormatters,
      this.maxLines = 1,
      this.controller,
      this.initialValue});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final texts = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              label!,
              style: texts.titleMedium?.copyWith(fontWeight: FontWeight.w500),
            ),
          ),
        TextFormField(
          initialValue: initialValue,
          controller: controller,
          keyboardType: keyboardType,
          onChanged: onChanged,
          onFieldSubmitted: onFieldSubmitted,
          inputFormatters: inputFormatters,
          maxLines: maxLines,
          decoration: InputDecoration(
              errorText: errorMessage,
              prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
              prefixIconColor: colors.onTertiaryContainer,
              suffixIcon: suffixIcon,
              suffixIconColor: colors.onTertiaryContainer,
              hintText: hintText,
              filled: true,
              // fillColor: colors.secondaryContainer,
              border: OutlineInputBorder(
                  // borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(8)),
              contentPadding: const EdgeInsets.all(8),
              isDense: true),
          validator: validator,
        ),
      ],
    );
  }
}
