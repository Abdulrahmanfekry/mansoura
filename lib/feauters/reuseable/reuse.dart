import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import '../models/studentmodel.dart';


class AwesomeTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final bool obscureText;
  final String hintText;


  AwesomeTextFormField({
    required this.controller,
    required this.labelText,
    required this.hintText,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        border: OutlineInputBorder(),
      ),
      validator: validator,
      keyboardType: keyboardType,
      obscureText: obscureText,
    );
  }
}
class AwesomeButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;
  final double borderRadius;
  final double padding;

  const AwesomeButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color = Colors.deepPurpleAccent,
    this.textColor = Colors.white,
    this.borderRadius = 8.0,
    this.padding = 16.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        padding: EdgeInsets.all(padding),
      ),
      onPressed: onPressed,
      child: Text(text, style: TextStyle(color: textColor)),
    );
  }
}
class AwesomeCard extends StatelessWidget {
  final User user;

  AwesomeCard({
    required this.user
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.deepPurpleAccent, // border color
          width: 1.0, // border width
        ),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        textDirection: TextDirection.rtl,
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: Row(
              children: [
                Text("name"),
                Spacer(),
                Text(user.name),

              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Row(
              children: [
                Text("sum"),
                Spacer(),
                Text("${user.sum}"),

              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Row(
              children: [
                const Text("Department"),
                Spacer(),
                Text(user.part),

              ],
            ),
          ),

        ],
      ),
    );
  }
}

class AwesomeCard2 extends StatelessWidget {
  final String a;
  final String b;
  AwesomeCard2({
    required this.a,
    required this.b,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.deepPurpleAccent, // border color
          width: 1.0, // border width
        ),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        textDirection: TextDirection.rtl,
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: Row(
              children: [
                Text("الاسم"),
                Spacer(),
                Text(a),

              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Row(
              children: [
                Text("الوظيفه"),
                Spacer(),
                Text(b),

              ],
            ),
          ),

        ],
      ),
    );
  }
}

