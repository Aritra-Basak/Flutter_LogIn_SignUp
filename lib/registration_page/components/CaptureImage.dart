import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CaptureImage extends StatefulWidget {
  const CaptureImage({super.key});

  @override
  State<CaptureImage> createState() => _CaptureImageState();
}

class _CaptureImageState extends State<CaptureImage> {
  File _imageFile= File("");
 final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 80.0,
            backgroundImage: _imageFile.path.isEmpty
                ? AssetImage("assets/images/profileImg2.png")
                : Image.file(_imageFile).image,//Taking the image from the File Method
             ),
           Positioned(
              bottom: 10.0,
              right: 1.0,
              child: InkWell(
                onTap: () {
                  // Show the bottom sheet when the InkWell is tapped
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) => bottomSheet(),
                  );
                },
                child: const Icon(
                  Icons.camera_alt,
                  color: Colors.teal,
                  size: 28,
                ),
              ))

      ],),
    );
  }

  Widget bottomSheet(){
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20
      ),
      child: Column(
        children: [
          Text("Choose Profile Photo",
            style: TextStyle(
                fontSize: 20
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(onPressed: ()async { await takePhoto(ImageSource.camera);}, icon: Icon(Icons.camera), label: Text("Camera")),
              SizedBox(width: 20),
              ElevatedButton.icon(onPressed: () async { await takePhoto(ImageSource.gallery);}, icon: Icon(Icons.image), label: Text("Gallery")),
            ],
          )
        ],
      ),
    );
  }

 Future<void> takePhoto(ImageSource source) async {
   final pickedFile = await _picker.pickImage(source: source);

   if (pickedFile != null) {
     setState(() {
       _imageFile = File(pickedFile.path);
     });
   }
 }

}


