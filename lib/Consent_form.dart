import 'package:flutter/material.dart';
import 'package:sdgp/screens/home/components/home_screen.dart';

class ConsentForm extends StatelessWidget {
  const ConsentForm({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Checkbox Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        checkboxTheme: const CheckboxThemeData(
          shape: CircleBorder(),
        ),
      ),
      home: const SkinDiseaseDetectionTermsScreen(),
    );
  }
}

class SkinDiseaseDetectionTermsScreen extends StatefulWidget {
  const SkinDiseaseDetectionTermsScreen({Key? key}) : super(key: key);

  @override
  _SkinDiseaseDetectionTermsScreenState createState() =>
      _SkinDiseaseDetectionTermsScreenState();
}

class _SkinDiseaseDetectionTermsScreenState
    extends State<SkinDiseaseDetectionTermsScreen> {
  bool _termsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Skin Disease Detection Terms and Conditions'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Skin Disease Detection Terms and Conditions',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'Please read these terms and conditions carefully before using the skin disease detection app. By using the app, you agree to be bound by these terms and conditions. If you do not agree to these terms and conditions, you must not use the app.',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 20.0),
              const Text(
                'Use of the App',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10.0),
              const Text(
                'The skin disease detection app is intended for informational purposes only and should not be used as a substitute for professional medical advice, diagnosis, or treatment. The app is not intended for use in emergencies or for diagnosing or treating a serious medical condition. If you have a medical emergency, call your doctor or emergency services immediately.',
                style: TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 20.0),
              const Text(
                'Disclaimer',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10.0),
              const Text(
                'The skin disease detection app is provided "as is" without warranty of any kind, either express or implied, including but not limited to the implied warranties of merchantability, fitness for a particular purpose, and non-infringement. The app owner does not warrant that the app will be uninterrupted or error-free.',
                style: TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 20.0),
              Row(
                children: [
                  Checkbox(
                    value: _termsAccepted,
                    onChanged: (value) {
                      setState(() {
                        _termsAccepted = value!;
                      });
                    },
                  ),
                  SizedBox(width: 10.0),
                  const Flexible(
                    child: Text(
                      'I accept the terms and conditions',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: _termsAccepted
                    ? () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),

                  );
                      }
                    : null,
                child: const Text('Continue'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
