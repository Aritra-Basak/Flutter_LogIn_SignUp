import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; //This provide us total height and width of our screen
    return Container(
      height: size.height,
      width:double.infinity,
      child: Stack( //The child element is a stack which contains all the children of type Widget
        alignment: Alignment.center,
        children: <Widget> [
          Positioned( // We will be using the widget call Positioned
            top: 0,
            left: 0,
            child: Image.asset("assets/images/main_top.png",width:size.width*0.3),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset("assets/images/main_bottom.png",width:size.width*0.2),
          ),
          child,
        ],
      ),
    );
  }
}
