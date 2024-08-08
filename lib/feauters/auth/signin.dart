// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/core/cubit/signcubit/signupCubit.dart';
import 'package:final_project/core/cubit/signcubit/signupstate.dart';
import 'package:final_project/core/dataHelper/cache_helper.dart';
import 'package:final_project/core/dataHelper/internetdata.dart';
import 'package:final_project/feauters/auth/signup.dart';
import 'package:final_project/feauters/home/child/results.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constants/constants.dart';
import '../home/child/homepage.dart';

class SignInScreen extends StatelessWidget{
  TextEditingController EmailControllr=TextEditingController();
  TextEditingController passwordControllr=TextEditingController();
   SignInScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body:Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                //  color: Colors.white,
                  child: Image.asset("assets/images/2.png",fit: BoxFit.contain,),
                ),
              ),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "LOG IN",
                            style: Theme.of(context).textTheme.headlineMedium
                          ),
                          TextButton(
                            style: ButtonStyle(
                                foregroundColor: MaterialStateProperty.all<Color>(mainColor)
                            ),
                            onPressed: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => SignUpScreen())
                              );
                            },
                            child: Text('SIGN UP',style: TextStyle(color: Theme.of(context).primaryColor),),
// 'SIGN UP',
// style: Theme.of(context).textTheme.button,
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 16),
                              child: Icon(
                                Icons.alternate_email,
                                color:  Theme.of(context).primaryColor,
                              ),
                            ),
                            Expanded(
                              child: TextField(
                                controller: EmailControllr,
                                  decoration: InputDecoration(
                                    hintText: 'Email Address',
                                  ),
                                  style: TextStyle(
                                      color: Colors.black
                                  )
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: Icon(
                              Icons.lock,
                              color:  Theme.of(context).primaryColor,
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              controller: passwordControllr,
                              decoration: InputDecoration(
                                  hintText: 'Password',
                                  fillColor: Colors.white
                              ),
                              style: TextStyle(
                                  color: Colors.black ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 30,),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Theme.of(context).primaryColor.withOpacity(.5),
                              ),
                            ),
                            child: Icon(
                              Icons.facebook_sharp,
                              color: Theme.of(context).primaryColor.withOpacity(.5),
                            ),
                          ),
                          SizedBox(width: 20),
                          Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Theme.of(context).primaryColor.withOpacity(.5),
                              ),
                            ),
                            child: Icon(
                              Icons.discord_sharp,
                              color: Theme.of(context).primaryColor.withOpacity(.5),
                            ),
                          ),
                          Spacer(),
                          Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color:  Theme.of(context).primaryColor,
                            ),
                            child: IconButton(
                              icon: Icon(Icons.arrow_forward),
                              color: Colors.white,
                              onPressed: (){
                                print(EmailControllr.text);
                                FirebaseAuth.instance.signInWithEmailAndPassword(email:EmailControllr.text, password:passwordControllr.text).then((value){
                                CacheHelper.putBoolean(key: "login", value: true);
                                FirebaseFirestore.instance.collection("users").doc(value.user!.uid).get().then((value){
                                    CacheHelper.putString(key: "name", value: value.data()!["name"]);
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>OptionSelectorScreen(name: value.data()!["name"],)));

                                }
                                );
                                }).catchError((onError){
                                  print(onError.toString());
                                });
                              },
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ]
      ),
    );
  }
}





