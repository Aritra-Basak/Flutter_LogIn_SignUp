import 'package:aritra_first_project/components/already_have_account_check.dart';
import 'package:aritra_first_project/components/rounded_input_field.dart';
import 'package:aritra_first_project/components/rounded_password_field.dart';
import 'package:aritra_first_project/login_page/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import '../../components/rounded_button.dart';
import 'CaptureImage.dart';
import 'GenderDropDown.dart';
import 'SignUpBackground.dart';


class Body extends StatefulWidget {

  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController firstNameController = new TextEditingController();
  TextEditingController lastNameController = new TextEditingController();
  TextEditingController mobileNumberController = new TextEditingController();
  TextEditingController emailIdController = new TextEditingController();
  TextEditingController ageController = new TextEditingController();
  TextEditingController locationController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController genderController = new TextEditingController();
  String? _currentAddress;
  Position? _currentPosition;
 /// Fetching Live Location Function Starts---

  /// Function 1: To check whether the accessing location permission is given or not.
  Future<bool> _handleLocationPermission() async {
    bool isServiceEnabled;
    LocationPermission permission;
    isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isServiceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              "Location Services are disabled. Please enable the services."
          )
      ));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
                "Location Services are denied."
            )
        ));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              "Location Services are permanently denied. We cannot access your current location."
          )
      ));
      return false;
    }
    return true;
  }
    ///Function 2 : To check if location permission is enabled then proceed with fetching the current location
    Future<void> _getCurrentPosition() async {
      final hasPermission = await _handleLocationPermission();
      if(!hasPermission) return;
      await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
      .then((Position position){
      setState(() => _currentPosition=position);
     _getAddressFromLatLong(_currentPosition!);
    }).catchError((e){
        debugPrint(e.toString());
      });
    }

    ///Function 3 :To convert the latitude and longitude from the above function into a proper address.
    Future <void> _getAddressFromLatLong(Position position) async {
      await placemarkFromCoordinates(_currentPosition!.latitude, _currentPosition!.longitude)
          .then((List<Placemark> placemarkArray){
            Placemark place = placemarkArray[0];
            setState(() {
              _currentAddress='${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
            });
            locationController.text="${_currentAddress}";
      }).catchError((e){
        debugPrint(e.toString());
      });
    }
  /// Fetching Live Location Function Ends---

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return SignUpBackground(
        child:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: size.height*0.06),
          const Text(
            "SIGN UP !",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.orangeAccent
          ),
        ),
          SizedBox(height: 20),
          CaptureImage(),
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
                      keyBoardType:TextInputType.number,
                      controller: mobileNumberController,
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
                      controller: emailIdController,
                    ),
                    GenderDropDownButton(controller: genderController),
                    RoundedInputField(
                      hintText: "Your Address",
                      icon: Icons.location_on,
                      onChanged: (value){},
                      controller: locationController,
                    ),
                    RoundedButton(
                      text: "GET LIVE LOCATION",
                      //press:()async { await _getCurrentPosition();},
                      press: _getCurrentPosition,
                    ),
                    RoundedPasswordField(
                      onChanged: (value){},
                      controller: passwordController,
                    ),
                    RoundedButton(
                      text: "SIGN UP",
                      press:(){

                      },
                    ),
                    AlreadyHaveAccountCheck(
                        login: false,
                        press: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context){return LoginScreen();},),);
                        }
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

