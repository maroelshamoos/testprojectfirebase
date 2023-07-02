
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//Color(0xFFC2185B)

Widget DefaultButton ({
  double width = double.infinity ,
  Color backgroundcolor = Colors.lightBlue,
  bool isUppercase = true ,
  double radius = 10.0 ,
  required Function function ,
  required String text ,
}) =>
    Container(
      height: 40.0,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundcolor ,
      ),
      child: MaterialButton(
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


Widget DefaultFormfield ({
  required TextEditingController controller ,
  required TextInputType inputtype ,
  Function? Onsubmit ,
  Function? Onchange ,
  Function? Ontap,
  bool isPassword = false ,
  required final String? Function(String?)? validate ,
  required String label ,
  required IconData preicon ,
  IconData? sufix ,
  Function? sufpressed ,
}) => TextFormField(
  controller: controller,
  keyboardType: inputtype ,
  obscureText: isPassword ,
  onFieldSubmitted:(s){
    Onsubmit!(s);
  },
  onChanged: (s){
    Onchange!(s);
  },
  onTap: (){
    Ontap!();
  },
  validator: validate,
  decoration: InputDecoration(
    labelText: label,
    prefixIcon: Icon(preicon) ,
    suffixIcon:sufix != null ?
    IconButton(onPressed:(){
      sufpressed!();
    }, icon: Icon(sufix))  : null ,
    border: const OutlineInputBorder(),
  ),
);
