import 'package:flutter/material.dart';

class IdCardScreen extends StatelessWidget {
  static const routeName = '/IdCardScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Text(
            'Residency',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
          ),
          SizedBox(
            width: 150,
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(children: [
          Image.asset('assets/Content.png'),
          SizedBox(
            height: 70,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: Size(310, 70),
              backgroundColor: Color(0xFFE2FF54),
              padding: EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
            onPressed: () {},
            child: Text(
              'SCAN ID CARD',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
          )
        ], mainAxisAlignment: MainAxisAlignment.center),
      ),
    );
  }
}
