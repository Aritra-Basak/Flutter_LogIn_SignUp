import 'package:flutter/material.dart';
import 'package:aritra_first_project/components/text_field_container.dart';

import '../../constants.dart';





class LoginOtpInput extends StatefulWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String>onChanged;
  final TextInputType? keyBoardType;
  final TextEditingController controller;
  const LoginOtpInput({
    super.key,
    required this.hintText,
    this.icon=Icons.person,
    required this.onChanged,
    this.keyBoardType=TextInputType.text, required this.controller,
  });
  @override
  State<LoginOtpInput> createState() => _RoundedInputField();
}
class _RoundedInputField extends State<LoginOtpInput> {
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          icon: Icon(widget.icon,color: kPrimaryColor,),
          hintText:widget.hintText,
          border: InputBorder.none,
        ),
        keyboardType: widget.keyBoardType,
        maxLength: 6,
        controller: widget.controller,
      ),
    );
  }
}
