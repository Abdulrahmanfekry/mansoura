import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:final_project/core/cubit/homeCubit/cubit.dart';
import 'package:final_project/core/cubit/homeCubit/state.dart';
import 'package:final_project/core/dataHelper/cache_helper.dart';
import 'package:final_project/feauters/home/child/demo.dart';
import 'package:final_project/feauters/home/child/results.dart';
import 'package:final_project/feauters/reuseable/reuse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/dataHelper/localData.dart';
import '../../doctors/doctors.dart';
import '../../models/studentmodel.dart';




class OptionSelectorScreen extends StatelessWidget {
  String? _selectedOption;  // تعديل: جعل المتغير قابلاً للقيمة null
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _sumController = TextEditingController();
  String? name=CacheHelper.getString(key: "name");


  OptionSelectorScreen({
    required this.name
});
  @override
  Widget build(BuildContext context) {
    bool ischeck=false;
    return BlocConsumer<UserCubit,UserState>(
        listener: (context,state){},
        builder: (context,state){
          var cupit=context.read<UserCubit>();
          String Department=cupit.Department;
          String Gender=cupit.Genderq;
          bool pass=cupit.qodorat;
          return  Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: double.infinity,
                      child: Card(
                          color: Colors.grey,
                          child: Image.asset("assets/images/2.png",fit: BoxFit.cover,)),
                    ),
                    Container(
                      margin: EdgeInsets.all(20),
                      child: ConditionalBuilder(
                        condition: !ischeck,
                        builder: (context) => Center(child: Text('اعرف تخصصك')),
                        fallback: (context) => Center(child: Text('  تخصصك هو ${cupit.user!.part}  ')),
                      ),
                    ),
                    AwesomeTextFormField(controller: _nameController, labelText: "اكتب اسمك", hintText: 'اكتب اسمك',),
                    SizedBox(height: 30,),
                    AwesomeTextFormField(controller: _sumController, labelText: "ادخل مجموعك", hintText: 'ادخل مجموعك',),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: AwesomeButton(text: "ادبي",color: cupit.isadaby?Theme.of(context).primaryColor:Colors.grey, onPressed: (){
                              cupit.Department="ادبي";
                              cupit.isadabychange();
                              print(Department);

                            }),
                          ),
                        ),
                        SizedBox(width: 30,),
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: AwesomeButton(text: "علمي",color: !cupit.isadaby?Theme.of(context).primaryColor:Colors.grey, onPressed: (){
                              cupit.Department="علمي";
                              cupit.isadabychange();
                              print(Department);
                            }),
                          ),
                        ),
                        SizedBox(width: 30,),

                        Text("تخحصصك"),

                      ],
                    ),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: AwesomeButton(text: "ذكر",color: cupit.ismale?Theme.of(context).primaryColor:Colors.grey, onPressed: (){
                              cupit.Genderq="ذكر";
                              cupit.Gender();
                              print(Gender);

                            }),
                          ),
                        ),
                        SizedBox(width: 30,),
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: AwesomeButton(text: "انثي",color: !cupit.ismale?Theme.of(context).primaryColor:Colors.grey, onPressed: (){
                              cupit.Genderq="انثي";
                              cupit.Gender();
                              print(Gender);
                            }),
                          ),
                        ),
                        SizedBox(width: 53,),

                        Text("جنسك"),

                      ],
                    ),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: AwesomeButton(text: "اجتاز",color: cupit.qodorat?Theme.of(context).primaryColor:Colors.grey, onPressed: (){
                              pass=cupit.qodorat;
                              cupit.passexam();
                              print(pass);

                            }),
                          ),
                        ),
                        SizedBox(width: 30,),
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: AwesomeButton(text: "لم يجتاز",color: !cupit.qodorat?Theme.of(context).primaryColor:Colors.grey, onPressed: (){
                              pass=cupit.qodorat;
                              cupit.passexam();
                              print(pass);
                            }),
                          ),
                        ),
                        SizedBox(width: 53,),

                        Text("قدرات"),

                      ],
                    ),
                    SizedBox(height: 20,),

                    Container(
                      width: double.infinity,

                      margin: EdgeInsets.all(10),
                      child: AwesomeButton(text: 'اعرف تخصصك',
                        color: Theme.of(context).primaryColor,
                        onPressed: () {
                        String? part;
                        if(pass==true){
                          if(Department=="ادبي"){
                            if(int.parse(_sumController.text)>=265){
                              part="تكنولوجيا التعليم";
                            }
                            else if(int.parse(_sumController.text)<265&&int.parse(_sumController.text)>=260){
                              part="الاعلام التربوي";
                            }
                            else if(int.parse(_sumController.text)<260&&Gender=="انثي"&&int.parse(_sumController.text)>233.5){
                              part="الاقتصاد المنزلي";
                            }
                            else if(int.parse(_sumController.text)<233.5&&int.parse(_sumController.text)>=216&&Gender=="انثي"){
                              part="الاقتصاد المنزلي - فنيه";
                            }
                            else if(int.parse(_sumController.text)<233.5&&int.parse(_sumController.text)>=216){
                              part="فنيه";
                            }
                            else if(int.parse(_sumController.text)<216&&Gender=="انثي"){
                              part=" فنيه - الاقتصاد المنزلي - موسيقي";
                            }
                            else if(int.parse(_sumController.text)<216){
                              part=" فنيه - موسيقي";
                            }
                            else{
                              part="مجموعك لا يتوافق";
                            }
                          }
                          else{
                            if(int.parse(_sumController.text)>=245){
                              part="تكنولوجيا التعليم";
                            }

                            else if(int.parse(_sumController.text)<265&&int.parse(_sumController.text)>=241){
                              part="الحاسب";
                            }
                            else if(int.parse(_sumController.text)<241&&Gender=="انثي"&&int.parse(_sumController.text)>233.5){
                              part="الاعلام التربوي - الاقتصاد المنزلي";

                            }
                            else if(int.parse(_sumController.text)<233.5&&Gender=="انثي"&&int.parse(_sumController.text)>216){
                              part="الاعلام التربوي - الاقتصاد المنزلي - فنيه";

                            }
                            else if(int.parse(_sumController.text)<233.5&&int.parse(_sumController.text)>216){
                              part="الاعلام التربوي - فنيه";

                            }
                            else if(int.parse(_sumController.text)<216&&Gender=="انثي"){
                              part=" موسيقي - الاعلام التربوي - الاقتصاد المنزلي - فنيه";

                            }

                            else{
                              part=" فنيه - موسيقي - الاعلام التربوي";
                            }

                          }
                        }
                        else{
                          if(Department=="ادبي"){
                            if(int.parse(_sumController.text)>=265){
                              part="تكنولوجيا التعليم";
                            }
                            else if(int.parse(_sumController.text)<265&&int.parse(_sumController.text)>=260){
                              part="الاعلام التربوي";
                            }
                            else if(int.parse(_sumController.text)<260&&Gender=="انثي"){
                              part="الاقتصاد المنزلي";
                            }
                            else{
                              part="مجموعك لا يتوافق";
                            }
                          }
                          else{
                            if(int.parse(_sumController.text)>=245){
                              part="تكنولوجيا التعليم";
                            }

                            else if(int.parse(_sumController.text)<265&&int.parse(_sumController.text)>=241){
                              part="الحاسب";
                            }
                            else if(int.parse(_sumController.text)<241&&Gender=="انثي"){
                              part="الاعلام التربوي - الاقتصاد المنزلي";

                            }
                            else{
                              part="الاعلام التربوي";
                            }

                          }
                        }
                        final aduser = User(
                          name: _nameController.text,
                          specialty: Department,
                          sum: int.parse(_sumController.text),
                          part: part!
                        );
                        cupit.addUser(aduser);
                        ischeck=true;
                      },),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
    );
  }
}
/* Container(
                      width: double.infinity,

                      margin: EdgeInsets.all(10),
                      child: AwesomeButton(
                        color: Theme.of(context).primaryColor,

                        text: ' سجل البحث', onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                      },),
                    ),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.all(10),

                      child: AwesomeButton(
                        color: Theme.of(context).primaryColor,

                        text: 'المرشدين الاكادمين', onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Doctors()));
                      },),
                    )*/