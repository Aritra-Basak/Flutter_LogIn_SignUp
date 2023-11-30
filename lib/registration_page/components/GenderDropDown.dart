import 'package:aritra_first_project/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../components/text_field_container.dart';
class GenderDropDownButton extends StatefulWidget {
  final TextEditingController controller;
  const GenderDropDownButton({Key? key, required this.controller}) : super(key: key);
  @override
  State<GenderDropDownButton> createState() => _GenderDropDownButtonState();
}
class _GenderDropDownButtonState extends State<GenderDropDownButton> {

  String selectedGender = 'Select Gender';
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return TextFieldContainer(
        child: DropdownButtonFormField<String>(
          dropdownColor: kPrimaryLightColor,
          decoration: const InputDecoration(
            icon: Icon(Icons.person,color: kPrimaryColor,),
            border: InputBorder.none,
          ),
          value: selectedGender,
          onChanged: (newValue) {
            setState(() {
              selectedGender = newValue!;
              widget.controller.text=newValue!;
            });
          },
          items: <String>['Select Gender','Male', 'Female', 'Other'].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
    );
  }
}