import 'package:flutter/material.dart';
import 'package:zzeenpay/constants/global_variables.dart';

class MyButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final IconData? icon;
  const MyButton({super.key, required this.text, required this.onTap, this.icon});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(icon == null ? 85 : 140, 56), backgroundColor: icon == null ? GlobalVariables.greyBackgroundColor :GlobalVariables.secondaryColor,
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(15), // Adjust the radius as needed
        ),
      ),
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(color: Colors.black, fontWeight: icon == null ? FontWeight.normal: FontWeight.bold, fontSize: 16),
          ),
          if(icon != null)
            const SizedBox(width: 10,),
          if (icon != null)    
            Icon(icon, color: Colors.black, size: 24,)
        ],
      ),
    );   
  }
}
