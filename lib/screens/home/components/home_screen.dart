import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sdgp/MyButton.dart';
import 'package:sdgp/screens/display_disease/DisplayDisease.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _ImagePickerWidgetState createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<Home> {
  File? _imageFile;

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DisplayDisease(imageFile: _imageFile!),
        ),
      );
    } else {
      print('No image selected.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 16.0),
                  const Text(
                    'Take a Close-Up Photo',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'Make your photo closer and focus it directly on the affected skin area.',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 11.0,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Image.asset('assets/images/home.png'),
                  const SizedBox(height: 16.0),
                  MyButton(
                    text: 'Take a Photo',
                    onPressed: () {
                      _pickImage(ImageSource.camera);
                    },
                  ),
                  const SizedBox(height: 16.0,),
                  MyButton(
                    text: 'Upload a Photo',
                    onPressed: () {
                      _pickImage(ImageSource.gallery);
                    },
                  ),
                ],
              ),
            ),
            ),
        );
    }
}