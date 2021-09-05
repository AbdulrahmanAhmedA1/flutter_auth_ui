import 'package:flutter/material.dart';

class DefaultTextField extends StatelessWidget {
  final String? Function(String?)? validate;
  final String? lText;
  final String hText;
  final Widget? pIcon;
  final Widget? sIcon;
  final bool secureText;
  final TextInputType textInputType;
  final void Function(String?)? onSave;
  final void Function()? onCompleted;
  final FocusNode? focNode;

  const DefaultTextField({
    this.focNode,
    this.onCompleted,
    required this.validate,
    this.lText,
    required this.hText,
    this.pIcon,
    this.sIcon,
    required this.textInputType,
    this.onSave,
    this.secureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focNode,
      keyboardType: textInputType,
      validator: validate,
      onSaved: onSave,
      obscureText: secureText,
      onEditingComplete: onCompleted,
      decoration: InputDecoration(
        border: InputBorder.none,
        fillColor: Colors.grey,
        hintText: hText,
        labelText: lText,
        hintStyle: TextStyle(color: Colors.grey[500]),
        prefixIcon: pIcon,
        suffixIcon: sIcon,
      ),
    );
  }
}
