import 'package:flutter/material.dart';

// calculator btn widget
Widget calcButton( String btnText, Color btnColor, void Function()? btnPressed) {
  return InkWell(
    onTap: btnPressed,
    child: Container(
      width: 110.0,
      height: 110.0,
      padding: const EdgeInsets.all(0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: btnColor, // You can change the color as needed
      ),
      child: Center(
        child: Text(
          btnText,
          style: TextStyle(
            color: btnText == '=' ? Colors.white : Colors.black,
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}
