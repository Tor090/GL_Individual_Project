import 'package:flutter/material.dart';

class ButtonBack extends StatelessWidget {
  const ButtonBack({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: InkWell(
            onTap: onTap,
            child: Icon(
              Icons.arrow_back,
              size: 30,
            ),
          )
   // ),
    );
  }
}