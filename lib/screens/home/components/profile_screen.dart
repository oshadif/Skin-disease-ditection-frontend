import 'package:flutter/material.dart';

import '../../../constants.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Name and photo at the top
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(


                  child: Row(

                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'John Doe',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,

                        ),
                      ),
                      SizedBox(width: 10.0),
                      Image.asset('assets/images/figure.png'),


                    ],

                  ),
                ),

                SizedBox(height: 10.0),

              ],
            ),
          ),
          // Container with cells
          Container(
            margin: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              children: [
                // First row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildCell('Age', 'Word 1', const EdgeInsets.all(8.0)),
                    _buildCell('Blood', 'Word 2', const EdgeInsets.all(8.0)),
                  ],
                ),
                // Second row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildCell('Height', 'Word 3', const EdgeInsets.all(8.0)),
                    _buildCell('Weight', 'Word 4', const EdgeInsets.all(8.0)),
                  ],
                ),
                const SizedBox(height: 16.0),








              ],
            ),
          ),

          Padding(padding: EdgeInsets.all(16.0),
          child:
          Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                  color: kButtonColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.all(16.0),


                child: Row(

                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset('assets/images/fire.png'),
                    SizedBox(width: 20.0),
                    const Text(
                      'Goal Settings',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: kTextColor,

                      ),
                    ),




                  ],

                ),
              ),
              const SizedBox(height: 10.0),

              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                  color: kButtonColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.all(16.0),

                child: Row(

                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset('assets/images/history.png'),
                    SizedBox(width: 20.0),
                    const Text(
                      'Patient History',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: kTextColor,

                      ),
                    ),




                  ],

                ),
              ),
            ],
          ),
          ),


        ],
      ),
    );
  }

  Widget _buildCell(String title, String word, EdgeInsets padding) {
    return Padding(
      padding: padding,
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            word,
            style: const TextStyle(fontSize: 14.0),
          ),

        ],
      ),
    );
  }
}



