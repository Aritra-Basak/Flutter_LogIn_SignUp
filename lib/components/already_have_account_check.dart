import 'package:flutter/material.dart';

import '../constants.dart';


class AlreadyHaveAccountCheck extends StatefulWidget {
  final bool login;
  final void Function()? press;
  const AlreadyHaveAccountCheck({
    super.key, this.login=true, required this.press,
  });
  @override
  State<AlreadyHaveAccountCheck> createState() => _AlreadyHaveAccountCheck();
}
class _AlreadyHaveAccountCheck extends State<AlreadyHaveAccountCheck> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          widget.login? "Don't have an Account? ":"Already have an Account? ",
          style: TextStyle(color: kPrimaryColor),
        ),
        GestureDetector(
          onTap: widget.press,
          child: Text(
            widget.login?"SIGN UP":"SIGN IN",
            style: TextStyle(
                color:kPrimaryColor,
                fontWeight: FontWeight.bold
            ),
          ),
        )

      ],
    );
  }
}

