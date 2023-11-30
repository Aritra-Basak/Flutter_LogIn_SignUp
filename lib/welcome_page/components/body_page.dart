import 'package:aritra_first_project/login_page/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../components/rounded_button.dart';
import '../../constants.dart';
import '../../registration_page/sign_up_registration_page.dart';
import 'background.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; //This provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
      child : Column( //Arranging the Children List of Widget in a column manner
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            "Welcome !",
            style:TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.orangeAccent
            ),
          ),
          SizedBox(height: size.height*0.05),
          SvgPicture.asset(
            'assets/icons/chat.svg',
            height: size.height*0.45,
          ),
          SizedBox(height: size.height*0.05),
          RoundedButton(
            text: "LOGIN",
            press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context){
                      return const LoginScreen();
                      },
                  ),
                );
              },//press
          ),
          RoundedButton(
            text: "SIGNUP",
            color: kPrimaryLightColor,
            textColor: Colors.black,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context){
                    return const SignUpScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
      ),
    );
  }
}



