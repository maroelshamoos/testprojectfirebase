import 'package:flutter/material.dart';

Widget DefaultButton ({
  double width = double.infinity ,
  bool isUppercase = true ,
  double radius = 10.0 ,
  required Function function ,
  required String text ,
  required Color backgroundcolor ,
}) =>
    Container(
      height: 40.0,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundcolor ,
      ),
      child: MaterialButton(
        color: backgroundcolor,
        child: Text(
          isUppercase ? text.toUpperCase() : text ,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20.0 ,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: (){
          function();
        },
      ),
    );