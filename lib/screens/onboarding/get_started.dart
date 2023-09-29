import 'package:flutter/material.dart';
import 'package:sdgp/screens/authentication/login/log_in.dart';

import 'package:sdgp/MyButton.dart';


class GetStartedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/startimage.png'),
            SizedBox(height: 60.0),
            MyButton(
              text: 'Get Started',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
            ),


          ],
        ),
      ),
    );
  }
}