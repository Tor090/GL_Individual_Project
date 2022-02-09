import 'package:flutter/material.dart';

class DefaultStyle {
  static const whiteColorStyle = TextStyle(color: Colors.white);
  static const circularBorder = BorderRadius.all(Radius.circular(25));
  static const movieBorder = BorderRadius.all(Radius.circular(10));
  static const headerStyle = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  static const movieDetailPadding = EdgeInsets.only(
    top: 20,
    left: 20,
    right: 20,
  );
  static const movieDetailContainerRadius = Radius.circular(24);
  static const movieDetailHeaderStyle =
      TextStyle(fontSize: 22, fontWeight: FontWeight.bold);
  static const detailText = TextStyle(fontSize: 18);
}
