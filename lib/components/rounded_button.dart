import 'package:flutter/material.dart';

import '../constants.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final void Function()? press;
  final Color color,textColor;
  const RoundedButton({
    super.key,
    required this.text,
    required this.press,
    this.color =kPrimaryColor,
    this.textColor=Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        width:size.width*0.8,
        child:ClipRRect(
          child:TextButton(
            style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 40),
                backgroundColor: color,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(29),
                )
            ), //styleFrom
            onPressed:press,
            child: Text(
              text,
              style: TextStyle(color: textColor),
            ),
          ),
        )
    );
  }
}