import 'package:flutter/material.dart';
import 'package:sdgp/Consent_form.dart';
import 'package:sdgp/MyButton.dart';
import 'package:sdgp/constants.dart';
import 'package:sdgp/screens/authentication/signup/sign_up.dart';
import 'package:sdgp/screens/authentication/reset_password/reset.dart';
import '../../home/components/home_screen.dart';

final _formKey = GlobalKey<FormState>();
class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              const SizedBox(height:40.0),
              Image.asset(
              'assets/images/logo.png',

            ),
              const SizedBox(height:60.0),
              Expanded(

                child: Container(
                    padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                const Text(
                  'Log In',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                  const SizedBox(height: 16.0),
                  Form(
                    autovalidateMode: AutovalidateMode.always,
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            labelText: 'Email address',
                            hintText: 'Enter your email address',
                          ),
                          validator: (value){
                            if(value == null || value.isEmpty){
                              return 'Please Enter your email';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16.0),
                        TextFormField(
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: 'Password',
                            hintText: 'Enter your password',
                          ),
                          validator: (value){
                            if(value == null || value.isEmpty){
                              return 'Please Enter the password';
                            }
                            return null;
                          },
                        ),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ResetPassword()),
                            );
                          },
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(fontSize: 10.0,
                          decoration: TextDecoration.underline),

                          textAlign: TextAlign.right,

                        ),
                  ),
                    ],
                ),



                        const SizedBox(height: 16.0),
                        MyButton(
                          text: 'Log In',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const ConsentForm()),
                            );
                          },
                        ),

                      ],
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(fontSize: 16.0),
                      ),
                      const SizedBox(width: 8.0),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Signup()),
                          );
                          },
                        child: Text(
                          'Sign up',
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                            color: Theme
                                .of(context)
                                .primaryColor,
                          ),
                        ),

                      ),

                    ],
                  ),
                      SizedBox(height: 20.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:const <Widget> [
                      Text('Or',
                        textAlign: TextAlign.center,),
                  ],
                  ),


                      const SizedBox(height: 20.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:<Widget> [

                          Container(
                            width: 54.0,
                            height: 54.0,
                            decoration: BoxDecoration(
                              color: kButtonColor.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(5),

                            ),
                            child: Image.asset('assets/images/google.png'),
                          )
                        ],
                      ),
                ],
                ),


              ),
              ),
            ],
          ),
        )
    );
  }
}