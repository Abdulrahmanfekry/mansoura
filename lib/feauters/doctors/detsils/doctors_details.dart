import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:final_project/core/dataHelper/localData.dart';
import 'package:final_project/feauters/reuseable/reuse.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/cubit/homeCubit/cubit.dart';
import '../../../core/cubit/homeCubit/state.dart';
import '../../models/studentmodel.dart';

class dep1 extends StatelessWidget {
  List<String> names=[
    "ا.م.د/محمد فوزي عبدالحميد",
    "د./محمد دسوقي موسي",
    "د./طارق محمد احمد عفيفي",
    "د./محمد مجد الشربيني عيد",
    "د./محمد المهدي محمد عبدالرحمن",
    "د./محمد محمد السعيد نعيم",
    "د./محمد احمد الحسيني",
    "د./احمد راغب محمد",
    "د./انس احمد عبدالعزيز",
  ];
  List<String>b=[
    "استاذ مساعد لقب علمي",
    "مدرس",
    "مدرس",
    "مدرس",
    "مدرس",
    "مدرس",
    "مدرس",
    "مدرس",
    "مدرس",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('تكنولوجيا التعليم'),
        ),
        body:ListView.builder(itemBuilder: (context,index){
          return AwesomeCard2(a: names[index], b: b[index]);
        },
          itemCount: names.length,

        ),

    );
  }
}
