import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final ValueChanged<String> onChanged;
  final String? errorText;
  final bool obscureText;
  final TextInputType keyboardType;
  final int? maxLength;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  const CustomTextField({
    Key? key,
    required this.label,
    required this.onChanged,
    this.errorText,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.maxLength,
    this.prefixIcon,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            obscureText: obscureText,
            onChanged: onChanged,
            keyboardType: keyboardType,
            maxLength: maxLength,
            decoration: InputDecoration(   
              hintText: label,
              filled: true,
              fillColor: Colors.grey[200],
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.blue),
              ),
              errorText: errorText,
            ),
          ),
        ],
      ),
    );
  }
}
