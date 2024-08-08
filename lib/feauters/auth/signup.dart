// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables




import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/feauters/auth/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';

class SignUpScreen extends StatelessWidget{
  TextEditingController EmailControllr=TextEditingController();
  TextEditingController passwordControllr=TextEditingController();
  TextEditingController namecontroller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  //color: Colors.white,
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
                            "SIGN UP",
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          TextButton(
                            style: ButtonStyle(
                                foregroundColor: MaterialStateProperty.all<Color>(mainColor)
                            ),
                            onPressed: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context)=> SignInScreen())
                              );
                            },
                            child: Text('LOG IN',style: TextStyle(color: Theme.of(context).primaryColor)),
                          ),
                        ],
                      ),
                      SizedBox(height: 6),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child:
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 16),
                              child: Icon(
                                Icons.person_sharp,
                                color:Colors.deepPurpleAccent,
                              ),
                            ),
                            Expanded(
                              child: TextField(
                                controller: namecontroller,
                                decoration: InputDecoration(
                                  hintText: 'Name',

                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 16),
                            child: Icon(
                              Icons.alternate_email_outlined,
                              color:Colors.deepPurpleAccent,
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              controller: EmailControllr,
                              decoration: InputDecoration(
                                  hintText: 'Email',
                                  fillColor: Colors.black
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: Icon(
                              Icons.lock,
                              color:Colors.deepPurpleAccent,
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              controller: passwordControllr,
                              decoration: InputDecoration(
                                  hintText: 'Password',
                                  fillColor: Colors.black
                              ),
                            ),
                          ),

                        ],
                      ),
                      SizedBox(height:10),
                     Row(
                       children: [
                         Container(

                           padding: EdgeInsets.all(16),
                           decoration: BoxDecoration(
                             shape: BoxShape.rectangle,
                             border: Border.all(
                               color:Colors.deepPurpleAccent.withOpacity(.5),
                             ),
                           ),
                           child: Row(
                             children: [
                               Icon(
                                 Icons.mail,
                                 color: Colors.deepPurpleAccent,
                               ),
                               SizedBox(width: 10,),
                               Text("G-mail")
                             ],
                           ),
                         ),
                         Spacer(),
                         Container(
                           padding: EdgeInsets.all(16),
                           decoration: BoxDecoration(
                             shape: BoxShape.circle,
                             color:  Colors.deepPurpleAccent,
                           ),
                           child: IconButton(
                             icon: Icon(Icons.arrow_forward),
                             color: Colors.white,
                             onPressed: (){

                                 FirebaseAuth.instance.createUserWithEmailAndPassword(email:EmailControllr.text, password:passwordControllr.text).then((value){
                                   FirebaseFirestore.instance.collection("users").doc(value.user!.uid).set({
                                     "name":namecontroller.text,
                                     "email":value.user!.email,
                                     "uid":value.user!.uid,
                                   });

                                   Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInScreen()));
                                   EmailControllr.clear();
                                   passwordControllr.clear();
                                 }).catchError((onError){
                                   print("@!#!@#!@#!@#!@#!@#!@#!@#!@#!@#!@#!@#!@#@!#!@#!@#!#!@#!#!#!@#)");
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
            ],

        ),
      );

  }
}