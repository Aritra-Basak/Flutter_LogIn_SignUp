import 'package:flutter/material.dart';

import '../../components/rounded_button.dart';
import '../../components/rounded_input_field.dart';
import '../../components/rounded_password_field.dart';
import '../../registration_page/components/CaptureImage.dart';
import '../../registration_page/components/GenderDropDown.dart';
import 'UserDetailsBackground.dart';

class UserBody extends StatefulWidget {

  const UserBody({super.key});

  @override
  State<UserBody> createState() => _UserBodyState();
}

class _UserBodyState extends State<UserBody> {
  TextEditingController firstNameController = new TextEditingController();
  TextEditingController lastNameController = new TextEditingController();
  TextEditingController mobileNumberController = new TextEditingController();
  TextEditingController emailIdController = new TextEditingController();
  TextEditingController ageController = new TextEditingController();
  TextEditingController locationController = new TextEditingController();
  TextEditingController genderController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return UserDetailsBackground(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: size.height*0.06),
            const Text(
              "YOUR DETAILS!",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.orangeAccent
              ),
            ),
            SizedBox(height: 20),
            CircleAvatar(
              radius: 80.0,
              // backgroundImage: _imageFile == null
              //     ? AssetImage("assets/images/profileImg2.png")
              //     : FileImage(File(_imageFile.path)) as ImageProvider<Object>,
              backgroundImage:AssetImage("assets/images/profileImg2.png"),
            ),
            SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children:[
                    RoundedInputField(
                      hintText: "First Name",
                      onChanged: (value){
                        //to do anything with the value.
                      },
                      controller: firstNameController,
                    ),
                    RoundedInputField(
                      hintText: "Last Name",
                      onChanged: (value){},
                      controller: lastNameController,
                    ),
                    RoundedInputField(
                        hintText: "Mobile Number",
                        icon:Icons.phone_android,
                        onChanged: (value){},
                        controller: mobileNumberController,
                        keyBoardType:TextInputType.number
                    ),RoundedInputField(
                      hintText: "Your Email Id",
                      icon:Icons.email,
                      onChanged: (value){},
                      keyBoardType: TextInputType.emailAddress,
                      controller: emailIdController,
                    ),
                    RoundedInputField(
                      hintText: "Your Age",
                      onChanged: (value){},
                      keyBoardType: TextInputType.number,
                      controller: ageController,
                    ),
                    RoundedInputField(
                      hintText: "Gender",
                      onChanged: (value){},
                      controller: genderController,
                    ),
                    RoundedInputField(
                      hintText: "Your Address",
                      icon: Icons.location_on,
                      onChanged: (value){},
                      controller: locationController,
                    ),
                    RoundedButton(
                      text: "LOG OUT",
                      press:(){},
                    ),

                    SizedBox(height: size.height*0.06),
                  ],
                ),
              ),
            ),
          ],
        )

    );
  }
}
