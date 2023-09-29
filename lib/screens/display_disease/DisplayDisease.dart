import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sdgp/MyButton.dart';
import 'package:sdgp/screens/display_disease/disease/disease.dart';

class DisplayDisease extends StatefulWidget {
  final File imageFile;

  const DisplayDisease({
    Key? key,
    required this.imageFile
  }) : super(key: key);

  @override
  State<DisplayDisease> createState() => _DisplayDiseaseState();
}

class _DisplayDiseaseState extends State<DisplayDisease> {
  late File _imageFile;

  @override
  void initState() {
    super.initState();
    _imageFile = widget.imageFile;
  }

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Preview'),
      ),
       body: Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Image.file(
               _imageFile,
               width: 100.0,
             ),
             const SizedBox(height: 16.0),

             MyButton(
               text: 'Use this image',
               onPressed: () {
                 Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) => Disease(imagePath: _imageFile.path)),

                 );
               },
             ),
             const SizedBox(height: 16.0),
             MyButton(
               text: 'Take another one',
               onPressed: () {
                 _pickImage(ImageSource.camera);
               },
             ),
             const SizedBox(height: 16.0),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
                 MyButton(
                   text: 'Upload another photo',
                   onPressed: () {
                     _pickImage(ImageSource.gallery);
                   },
                 ),
               ],
             ),
           ],
         ),
       ),

    );
  }
}
