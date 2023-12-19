import 'package:flutter/material.dart';
import 'package:zzeenpay/constants/global_variables.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final int maxlines;
  final IconData icon;
  const CustomTextField(
      {super.key, required this.hintText, required this.controller, this.maxlines = 1, required this.icon});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isFocused = false;

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (hasFocus) {
        setState(() {
          isFocused = hasFocus;
        });
      },
      child: TextFormField(
        maxLines: widget.maxlines,
        controller: widget.controller,
        decoration: InputDecoration(
            prefixIcon: Icon(widget.icon),
            prefixIconColor: isFocused ? GlobalVariables.primaryColor : GlobalVariables.textColor1,
            hintText: widget.hintText,
            focusedBorder: const OutlineInputBorder(
              borderSide:
                  BorderSide(color: GlobalVariables.primaryColor), // Change the border color
            ),
            border:  OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
                borderSide:
                    const BorderSide(color: GlobalVariables.textColor1)),
            enabledBorder:  OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
                borderSide:
                    const BorderSide(color: GlobalVariables.textColor1))),
            
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Enter your ${widget.hintText}';
          }
          return null;
        },
      ),
    );
  }
}
