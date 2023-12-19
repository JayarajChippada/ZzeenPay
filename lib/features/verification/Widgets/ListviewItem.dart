import 'package:flutter/material.dart';

class ListviewItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final Icon icon;
  final String routeName;
  ListviewItem(this.title, this.subtitle, this.icon, this.routeName);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(routeName);
      },
      child: Card(
        elevation: 5,
        margin: EdgeInsets.all(15),
        color: Color(0xFFFFFFFF),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListTile(
            contentPadding: EdgeInsets.all(5),
            leading: CircleAvatar(
                backgroundColor: Colors.grey.shade300,
                child: FittedBox(
                  child: icon,
                  fit: BoxFit.contain,
                )),
            title: Text(
              title,
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
            subtitle: Text(subtitle),
          ),
        ),
      ),
    );
  }
}
