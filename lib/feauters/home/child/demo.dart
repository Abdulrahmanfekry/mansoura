import 'package:flutter/material.dart';

class Aboutus extends StatelessWidget {
  const Aboutus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child:  Container(
          margin: EdgeInsets.all(20),
          child: Text(
            "انشات كليه التربيه النوعيه بالمنصوره بالقرار  1177 لسنه 1990م وبدات الدراسه بها في العام الجامعي 1990/1991 م وانشئت كليه التربيه النوعيه بمنيه النصر بالقرار رقم 1161في عام 1990 كما انشئت كليه التربيه النوعيه بميت غمر رقم1178في عام 1991م وكانت الكليات الثلاث تابعه لوزاره التعليم العالي ثم صدر القرار الجمهوري رقم 329 لسنه 1998م بضم الكليات الثلاث الى جامعه المنصوره وذلك في كليه واحده باسم كليه التربيه النوعيه بالمنصوره وفرعيها بميت غمر ومنيه النصر",
            textDirection: TextDirection.rtl,
            maxLines: 15,

          ),
        ),
    );
  }
}
