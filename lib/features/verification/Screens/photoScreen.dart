import 'package:flutter/material.dart';

class PhotoScreen extends StatelessWidget {
  static const routeName = '/photoScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            alignment: Alignment.topCenter,
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back),
          ),
          SizedBox(
            width: 340,
          )
        ],
      ),
      body: Stack(fit: StackFit.expand,
        children: [
          Image.asset('assets/Scanning Photo.png'),
          Positioned(
            bottom: 30,
            left: 20,
            right: 20,
            child: ElevatedButton(
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
                'TAKE PHOTO',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
          )
        ],
      ),
    );
  }
}
