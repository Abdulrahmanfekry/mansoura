import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:final_project/core/dataHelper/localData.dart';
import 'package:final_project/feauters/reuseable/reuse.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/cubit/homeCubit/cubit.dart';
import '../../../core/cubit/homeCubit/state.dart';
import '../../models/studentmodel.dart';

class dep2 extends StatelessWidget {
  List<String> names=[
    "ا.د/اماني فزوي محمد",
    "د./رانيا عدلي ابراهيم",
    "د./شيماء محمد مندوه",
    "د./مروة حسين محمد",
    "د./محمد محمود محمد",
    "ايمان عطيه اسماعيل",
    "محمد اشرف ابراهيم",
    "بسنت محمد مسعد",
    "سمر عدي محمد محي",
    "عفاف محمود محمد",
    "اسراء عباس عبدالحميد",
    "ضحي عبدالعزيز عبدالحليم",
  ];
  List<String>b=[
    "استاذ ",
    "مدرس",
    "مدرس",
    "مدرس",
    "مدرس",
    " مدرس مساعد",
    "مدرس مساعد",
    "معيد",
    "معيد",
    "معيد",
    "معيد",
    "معيد",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('حاسب'),
      ),
      body:ListView.builder(itemBuilder: (context,index){
        return AwesomeCard2(a: names[index], b: b[index]);
      },
        itemCount: names.length,

      ),

    );
  }
}
