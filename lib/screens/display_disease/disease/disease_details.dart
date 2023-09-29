import 'package:flutter/material.dart';
import '../../../MyButton.dart';
import '../../home/components/appointment_screen.dart';
import '../../home/components/home_screen.dart';
import 'diseaseTypes.dart';

class DiseaseDetails extends StatefulWidget {
  final String imagePath;
  final DiseaseTypes? diseaseDetails;


  const DiseaseDetails({Key? key, required this.imagePath, required this.diseaseDetails}) : super(key: key);

  @override
  _DiseaseDetailsState createState() => _DiseaseDetailsState();
}

class _DiseaseDetailsState extends State<DiseaseDetails> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Disease Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Disease Title
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                '${widget.diseaseDetails?.name}',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),

            // Conditions Title and Description
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '${widget.diseaseDetails?.description}',
                    style: TextStyle(fontSize: 13),
                  ),
                ],
              ),
            ),

            // Treatments Title and Description
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Treatments',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '${widget.diseaseDetails?.treatmentOptions}',
                    style: TextStyle(fontSize: 13),
                  ),
                ],
              ),
            ),


            SizedBox(height: 10),
            MyButton(
              text: 'Go Back to Home',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
