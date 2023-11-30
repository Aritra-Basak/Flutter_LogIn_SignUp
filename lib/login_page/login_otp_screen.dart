import 'package:aritra_first_project/login_page/components/login_otp_body.dart';
import 'package:flutter/material.dart';

import 'components/login_body.dart';

class LoginOTPScreen extends StatefulWidget {
  const LoginOTPScreen({super.key});

  @override
  State<LoginOTPScreen> createState() => _LoginOTPScreenState();
}

class _LoginOTPScreenState extends State<LoginOTPScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      body: LoginOtpBody(),
    );
  }
}
