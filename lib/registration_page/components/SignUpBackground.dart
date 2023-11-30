import 'package:aritra_first_project/constants.dart';
import 'package:aritra_first_project/welcome_page/welcome_page.dart';
import 'package:flutter/material.dart';


class SignUpBackground extends StatefulWidget {
  final Widget child;
  const SignUpBackground({
    super.key, required this.child,
  });

  @override
  State<SignUpBackground> createState() => _SignUpBackground();
}

class _SignUpBackground extends State<SignUpBackground> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children:<Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset("assets/images/signup_top.png",
              width: size.width*0.3,
            ),
          ),
          Positioned(
            top: size.height*0.05,
            right:size.width*0.005,
              width: size.width*0.3,
            child:  Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
              child: GestureDetector(
                onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context){return WelcomePage();},),);},
                child: const Icon(Icons.exit_to_app,
                  size: 24,
                  color: kPrimaryColor,
                ),
              ),
            ),
           ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset("assets/images/main_bottom.png",
              width: size.width*0.25,
            ),
          ),
          widget.child,
        ],
      ),

    );
  }
}

