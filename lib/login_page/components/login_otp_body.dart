import 'package:aritra_first_project/components/rounded_button.dart';

import 'package:aritra_first_project/login_page/login_page.dart';
import 'package:aritra_first_project/registration_page/sign_up_registration_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../components/already_have_account_check.dart';
import '../../components/rounded_input_field.dart';

import '../../user_details_page/User_details_page.dart';
import 'login_background.dart';
import 'login_otp_input_button.dart';


class LoginOtpBody extends StatefulWidget {
  const LoginOtpBody({
    super.key,
  });

  @override
  State<LoginOtpBody> createState() => _Body();
}
class _Body extends State<LoginOtpBody> {
  TextEditingController mobileNumberController = new TextEditingController();
  TextEditingController otpController = new TextEditingController();
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
            height: size.height*0.35,
          ),
          // SizedBox(height: size.height*0.05),
          RoundedInputField(
            hintText: "Your Mobile Number",
            icon: Icons.phone_android,
            onChanged: (value){},
            keyBoardType: TextInputType.number,
            controller: mobileNumberController,
          ),
          RoundedButton(
            text: "SEND OTP",
            press:(){},
          ),
          Column(
            children: [
              LoginOtpInput(
                hintText: "OTP",
                icon: Icons.mobile_friendly_outlined,
                onChanged: (value){},
                keyBoardType: TextInputType.number,
                controller: otpController,
              ),

              RoundedButton(
                text: "LOGIN",
                press:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context){return UserPage();},),);
                },
              ),
            ],
          ),

          RoundedButton(
            text: "USE EMAIL ID & PASSWORD",
            press:(){
              Navigator.push(context, MaterialPageRoute(builder: (context){return LoginScreen();},),);
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
