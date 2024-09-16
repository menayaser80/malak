import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button(
      {super.key,
        required this.title,
        required this.onPressed,
        required this.disable});

  final String title;
  final bool disable; //this is used to disable button
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: disable ? null : onPressed,
      child: Container(
        width: 200,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: disable ? Color(0xffD1D1D6) :Color(0xff4CB9E7),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
          ),
        ),
      ),
    );
  }
}