import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:final_project/core/dataHelper/localData.dart';
import 'package:final_project/feauters/reuseable/reuse.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/cubit/homeCubit/cubit.dart';
import '../../../core/cubit/homeCubit/state.dart';
import '../../models/studentmodel.dart';

class dep4 extends StatelessWidget {
  List<String> names=[
    "ا.د/علاء الدين احمد مرسي",
    "ا.د/عبدالغني محمود عبدالغني",
    "ا.د/هناء فاروق محمد",
    "ا.د/اميرة عبدالله نور",
    "ا.د/اسامه ابراهيم عبدالروف",
    "ا.د/لبني احمد محمد",
    "ا.د/فاطمه محمد الزمزري",
    "ا.د/هاله عزت مصطفي",
    "ا.د/نجلاء محمد احمد",
    "ا.م.د/صغاء صبري ابراهيم",
    "ا.م.د/جيهان محمود عبدالحميد",
    "ا.م.د/دعاء محمد راغب",
    "ا.م.د/حنان حنا عزيز",
    "د/فاطمه جاد مجمود",
    "د/لبني عبدالغني اسماعيل",
    "امينه عماد نبيه",
    "غاده محمود علي",
    "رحاب السعيد محمد",
    "هاجر السيد عبدالمجيد",
  ];
  List<String>b=[
    "استاذ متفرغ",
    "استاذ متفرغ",
    "استاذ",
    "استاذ",
    "استاذ",
    "استاذ",
    "استاذ",
    "استاذ",
    "استاذ",
    "استاذ مساعد",
    "استاذ مساعد",
    "استاذ مساعد",
    "استاذ مساعد",
    "مدرس",
    "مدرس",
    "مدرس مساعد",
    "معيد",
    "معيد",
    "معيد",

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الاقتصاد المنزلي'),
      ),
      body:ListView.builder(itemBuilder: (context,index){
        return AwesomeCard2(a: names[index], b: b[index]);
      },
        itemCount: names.length,

      ),

    );
  }
}
