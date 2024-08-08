import 'dart:async';

import 'package:final_project/main.dart';
import 'package:flutter/material.dart';

import '../../core/dataHelper/cache_helper.dart';
import '../home/child/homepage.dart';
import '../home/homescreen.dart';


class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;
  late Animation<Offset> animation;


  @override
  void initState() {
    super.initState();
    animateSliding();
    NavetoHome();
  }
  void animateSliding(){
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    _animation = Tween<Offset>(begin: Offset(0,10),end: Offset(0,0)).animate(_controller);
    animation = Tween<Offset>(begin: Offset(0,-10),end: Offset(0,0)).animate(_controller);
    _controller.forward();
  }
  void NavetoHome(){

    Future.delayed(Duration(seconds: 4),(){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeMain(),));
    });
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedBuilder(
                  animation: animation,
                  builder: (BuildContext context, Widget? child) {
                    return SlideTransition(
                        position:animation ,
                        child: Image.asset("assets/images/1.png"));
                  },),
           SizedBox(height: 20,),
           AnimatedBuilder(
             animation: _animation,
             builder: (BuildContext context, Widget? child) {
               return SlideTransition(
                   position:_animation ,
                   child: const   Text("Welcome to our university",style: TextStyle(fontSize: 30),));

             },
             )
            ],
          ) // Ensure your photo is in the assets folder
        ),
    );
  }
}
