import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:final_project/core/dataHelper/localData.dart';
import 'package:final_project/feauters/reuseable/reuse.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/cubit/homeCubit/cubit.dart';
import '../../../core/cubit/homeCubit/state.dart';
import '../../models/studentmodel.dart';

class dep3 extends StatelessWidget {
  List<String> names=[
    "ا.د/عزه مصطفي حافط",
    "ا.د/ايمان احمد خضر",
    "ا.د/حازم انور محمد",
    "ا.د/السيد مجمد عزت",
    "ا.د/اسامه عبدالرحيم علي",
    "ا.د/ايمان عز الدين محمد",
    "ا.د/ابراهيم محمد ابو المجد",
    "د/اميرة اسماعيل مصطفي",
    "ا.م.د/اسماء عبدالمنعم ابوالفتوح",
    "ا.م.د/هشام سعد احمد",
    "ا.م.د/نجيه احمد قدري",
    "د/فاتن احمد المنولي",
    "د/اماني محمود محمد",
    "د/هاله غزالي محمد",
    "د/مريم فاروق خليل",
    "د/رانيا مصطغي محمد",
    "د/سارة محمد يونس",
    "د/زينب احمد السيد",
    "د/نشوي فتحي المغاوري",
    "ياسمين صلاح محمد",
    "ايمان صلاح محمد",
    "الشيماء حالد السباعي",
    "خلود عماد الدين",
  ];
  List<String>b=[
    "استاذ متفرغ",
    "استاذ",
    "استاذ",
    "استاذ",
    "استاذ",
    "استاذ",
    "استاذ",
    "استاذ متفرغ",
    "استاذ مساعد",
    "استاذ مساعد",
    "استاذ مساعد",
    "مدرس",
    "مدرس",
    "مدرس",
    "مدرس",
    "مدرس",
    "مدرس",
    "مدرس",
    "مدرس",
    "مدرس مساعد",
    "مدرس مساعد",
    "معيد",
    "معيد",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الاعلام التربوي'),
      ),
      body:ListView.builder(itemBuilder: (context,index){
        return AwesomeCard2(a: names[index], b: b[index]);
      },
        itemCount: names.length,

      ),

    );
  }
}
