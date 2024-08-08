import 'package:final_project/feauters/doctors/detsils/dep2.dart';
import 'package:final_project/feauters/doctors/detsils/dep3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../home/child/results.dart';
import '../reuseable/reuse.dart';
import 'detsils/dep4.dart';
import 'detsils/doctors_details.dart';

class Doctors extends StatelessWidget {
  const Doctors({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Center(
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: AwesomeButton(
                color: Theme.of(context).primaryColor,

                text: 'تكنولوجيا التعليم', onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>dep1()));
              },),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: AwesomeButton(
                color: Theme.of(context).primaryColor,

                text: 'حاسب', onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>dep2()));
              },),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: AwesomeButton(
                color: Theme.of(context).primaryColor,

                text: 'الاعلام التربوي', onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>dep3()));
              },),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: AwesomeButton(
                color: Theme.of(context).primaryColor,

                text: 'الاقتصاد المنزلي', onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>dep4()));
              },),
            ),

          ],
        ),
    );
  }
}
