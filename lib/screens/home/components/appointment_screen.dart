import 'package:flutter/material.dart';
import 'package:sdgp/MyButton.dart';


import '../../../constants.dart';

class Appointment extends StatelessWidget {
  const Appointment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctors Near By'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
            color: kButtonColor.withOpacity(0.5),
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.all(20.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [


              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Doctors name',
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: kTextColor,
                      ),
                    ),

                    SizedBox(height: 8),
                    const Text(
                      'Doctors position',
                      style: TextStyle(fontSize: 13.0,
                        color: kTextColor,),
                    ),
                    SizedBox(height: 8),
                    MyButton(
                      text: 'View',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Appointment()),
                        );
                      },
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ),

      ),

    );
  }
}
