

import 'package:flutter/material.dart';

class UserColors {
  static const transparent = Colors.transparent;
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color darkGray = Color(0xFF4E4E4E);
  static const Color lightGray = Color(0xFFA0A0A0);
  static const Color backGround = Color(0xFFF2F3F2);
  static const Color principal = Colors.green;
  static const Color error = Colors.red;

  static BoxShadow userCardBoxShadow() => const BoxShadow(
    color: UserColors.lightGray,
    offset: Offset(0, 3),
    blurRadius: 4,
  );
}

