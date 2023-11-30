import 'package:aritra_first_project/components/text_field_container.dart';
import 'package:flutter/material.dart';

import '../constants.dart';


class RoundedInputField extends StatefulWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String>onChanged;
  final TextInputType? keyBoardType;
  final TextEditingController controller;
  const RoundedInputField({
    super.key,
    required this.hintText,
    this.icon=Icons.person,
    required this.onChanged,
    required this.controller,
    this.keyBoardType=TextInputType.text,
  });
  @override
  State<RoundedInputField> createState() => _RoundedInputField();
}
class _RoundedInputField extends State<RoundedInputField> {
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          icon: Icon(widget.icon,color: kPrimaryColor,),
          hintText:widget.hintText,
          border: InputBorder.none,
        ),
        keyboardType: widget.keyBoardType,
        controller: widget.controller,
      ),
    );
  }
}
