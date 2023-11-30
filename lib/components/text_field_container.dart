import 'package:flutter/material.dart';

import '../constants.dart';

class TextFieldContainer extends StatefulWidget{
  final Widget child;
  const TextFieldContainer({
    super.key, required this.child,
  });

  @override
  State<TextFieldContainer> createState() => _TextFieldContainer();
}
class _TextFieldContainer extends State<TextFieldContainer> {
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
      width: size.width*0.8,
      decoration: BoxDecoration(
          color: kPrimaryLightColor,
          borderRadius: BorderRadius.circular(29)
      ),
      child: widget.child,
    );
  }
}

