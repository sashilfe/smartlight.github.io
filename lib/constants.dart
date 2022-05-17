import 'package:flutter/material.dart';

const primaryColor = Color(0xFFFFDA00);
const secondaryColor = Color(0xFF6E6F74);
const bgColor = Color(0xFF3A3A3C);
const txColor = Color(0xFFA4A6B3);
const txcolortitle = Color(0xFF252733);
const bgColorlight = Color(0xFFF3F3F3);

const defaultPadding = 8.0;

final kHintTextStyle = TextStyle(
  color: Colors.white54,
  fontSize: 14.0,
);

final kLabelStyle = TextStyle(
  color: Colors.white,
);

final kBoxDecorationStyle = BoxDecoration(
  color: secondaryColor,
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);
