import 'package:aritra_first_project/components/rounded_button.dart';
import 'package:aritra_first_project/constants.dart';
import 'package:aritra_first_project/login_page/login_otp_screen.dart';
import 'package:aritra_first_project/registration_page/sign_up_registration_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../components/already_have_account_check.dart';
import '../../components/rounded_input_field.dart';
import '../../components/rounded_password_field.dart';
import '../../components/text_field_container.dart';
import '../../user_details_page/User_details_page.dart';
import 'login_background.dart';


class Body extends StatefulWidget {
  const Body({
    super.key,
  });

  @override
  State<Body> createState() => _Body();
}
class _Body extends State<Body> {
  TextEditingController emailIdController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return LoginBackground(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            "LOGIN !",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.orangeAccent),
          ),
          // SizedBox(height: size.height*0.05),
          SvgPicture.asset(
            'assets/icons/login.svg',
            height: size.height*0.45,
          ),
          // SizedBox(height: size.height*0.05),
          RoundedInputField(
            hintText: "Your Email Id",
            onChanged: (value){},
            controller: emailIdController,
            ),
          RoundedPasswordField(
            onChanged: (value){},
            controller: passwordController,),
          RoundedButton(
            text: "LOGIN",
            press:(){
              Navigator.push(context, MaterialPageRoute(builder: (context){return UserPage();},),);
            },
          ),
          RoundedButton(
            text: "USE OTP",
            press:(){
              Navigator.push(context, MaterialPageRoute(builder: (context){return LoginOTPScreen();},),);
            },
          ),
          AlreadyHaveAccountCheck(
            press: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){return SignUpScreen();},),);
            },
          )
        ],
      ),
    );
  }
}
