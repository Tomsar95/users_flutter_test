

import 'package:flutter/material.dart';
import 'package:users_tomas_sarmiento/src/common/utils/user_colors.dart';

class UserTextStyles {
  static TextStyle _baseFont =  const TextStyle(
      fontWeight: FontWeight.w400,
      fontFamily: 'Roboto',
      fontStyle: FontStyle.normal,
      fontSize: 16,
      height: 1.3);

  static TextStyle baseFontOriginalHeight() =>  TextStyle(
    fontWeight: FontWeight.w400,
    fontFamily: 'Roboto',
    fontStyle: FontStyle.normal,
    fontSize: 16,
  );


  static TextStyle robotoBold()=>
      _baseFont.copyWith(
          fontWeight: FontWeight.bold,
          color: UserColors.darkGray);

  static TextStyle robotoLight()=>
      _baseFont.copyWith(
          fontWeight: FontWeight.w300,
          fontSize: 18,
          color: UserColors.darkGray);


  static TextStyle robotoRegular()=>
      _baseFont.copyWith(
          fontWeight: FontWeight.w400,
          color: UserColors.darkGray);

  static TextStyle signUpTitle() => _baseFont.copyWith(fontSize: 40, fontWeight: FontWeight.w800, color: UserColors.black);

  static TextStyle buttonTextStyle = _baseFont.copyWith(color: Colors.white);

  static TextStyle errorLabelStyle = _baseFont.copyWith(color: UserColors.error, fontSize: 16);

}