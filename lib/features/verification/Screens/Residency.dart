import 'package:flutter/material.dart';
import './Id_card_screen.dart';

class Residency extends StatefulWidget {
  static const routeName = '/residency';
  @override
  State<Residency> createState() => _ResidencyState();
}

class _ResidencyState extends State<Residency> {
  var items = ['India', 'United States', 'China', 'Japan'];
  // Map<String,String> test ={'':'',};
  int selectedOption = 1;
  String dropDownValue = "India";
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              'Proof Of Residency',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 28),
            ),
            SizedBox(
              height: 35,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Nationality',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 20),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            DropdownButton(
              items: items
                  .map(
                    (e) => DropdownMenuItem(
                      child: Text(
                        e,
                        style: TextStyle(fontSize: 18),
                      ),
                      value: e,
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                setState(
                  () {
                    dropDownValue = value!;
                  },
                );
              },
              value: dropDownValue,
            ),
            SizedBox(
              height: 30,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Verification Method',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 20),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            ListTile(
              title: const Text('Passport'),
              leading: Radio(
                value: 1,
                groupValue: selectedOption,
                onChanged: (value) {
                  setState(() {
                    selectedOption = value!;
                  });
                },
              ),
            ),
            ListTile(onTap: () {
              Navigator.of(context).pushNamed(IdCardScreen.routeName);
            },
              title: const Text('ID Card'),
              leading: Radio(
                value: 2,
                groupValue: selectedOption,
                onChanged: (value) {
                  setState(() {
                    selectedOption = value!;
                  });
                },
              ),
            ),
            SizedBox(
              height: 150,
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
                'NEXT',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}
