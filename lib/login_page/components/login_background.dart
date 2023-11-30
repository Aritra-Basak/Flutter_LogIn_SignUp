import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../welcome_page/welcome_page.dart';

class LoginBackground extends StatefulWidget {
  final Widget child;
  const LoginBackground({
    super.key,
    required this.child,
  });
  @override
  State<LoginBackground> createState() => _LoginBackground();
}

class _LoginBackground extends State<LoginBackground> {

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget> [
          Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                "assets/images/main_top.png",
                width: size.width*0.35,
              )
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
              right: 0,
              child: Image.asset(
                "assets/images/login_bottom.png",
                width: size.width*0.35,
              )
          ),
          widget.child, //In case of statefull to access any passed arguments write like this way
        ],
      ),
    );
  }
}
