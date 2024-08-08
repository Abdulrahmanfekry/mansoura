// ignore_for_file: prefer_const_constructors


import 'package:final_project/feauters/auth/signin.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';

class WelcomeScreen extends StatelessWidget{
  const WelcomeScreen ({
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Column(
        children: [
          Expanded(
           flex: 3,
            child: Container(

              child: Image.asset("assets/images/1.png",fit: BoxFit.contain,),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Welcome To Our University",
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                    ],
                  ),
                ),
                FittedBox(
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: ((context) => SignInScreen())
                      ));
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 80),
                      padding: EdgeInsets.symmetric(horizontal: 26, vertical: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Theme.of(context).primaryColor,
                      ),
                      child: Row(
                        children: [
                          Text(
                            "START JOURNEY",
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                )
            )],
            ),
          )
        ],
      ),
    );
  }
}