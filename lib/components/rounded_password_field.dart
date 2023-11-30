import 'package:aritra_first_project/components/text_field_container.dart';
import 'package:flutter/material.dart';

import '../constants.dart';


class RoundedPasswordField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final TextEditingController controller;
  const RoundedPasswordField({
    super.key, required this.onChanged, required this.controller,
  });
  @override
  State<RoundedPasswordField> createState() => _RoundedPasswordField();

}
class _RoundedPasswordField extends State<RoundedPasswordField> {
  bool _passwordVisible=true;

  void _toggleObscured() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        child: TextField(
          obscureText: _passwordVisible,
          onChanged: widget.onChanged,
          decoration: InputDecoration(
            hintText: "Password",
            icon: const Icon(
              Icons.lock,
              color:kPrimaryColor,
            ),
            suffixIcon:Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
              child: GestureDetector(
                onTap: _toggleObscured,
                child: Icon(
                  _passwordVisible
                      ? Icons.visibility_off_rounded
                      : Icons.visibility_rounded,
                  size: 24,
                ),
              ),
            ),

            border: InputBorder.none,
          ),
          controller: widget.controller,
        ));
  }
}