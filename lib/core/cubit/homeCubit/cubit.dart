import 'package:final_project/core/cubit/homeCubit/state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../feauters/doctors/doctors.dart';
import '../../../feauters/home/child/demo.dart';
import '../../../feauters/home/child/homepage.dart';
import '../../../feauters/home/child/results.dart';
import '../../../feauters/models/studentmodel.dart';
import '../../dataHelper/cache_helper.dart';
import '../../dataHelper/localData.dart';


class UserCubit extends Cubit<UserState> {
  final DatabaseHelper databaseHelper;

  UserCubit(this.databaseHelper) : super(UserInitial());
  List<User> users=[];
  User? user;

  Future<void> loadUsers() async {
    emit(UserLoading());
      await databaseHelper.getUsers().then((value) {
        users=value;
        print(users!.length);
        print(users![1].id);
        emit(UserLoaded(users!));
      }).catchError((onError){
        print("|||@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
        print(onError.toString());
        emit(UserError("Failed to load users"));
      });
  }

  Future<void> addUser(aduser) async {
    user=aduser;
    try {
      await databaseHelper.insertUser(user!).then((value) =>print("${user!.id}+${user!.sum}+${user!.name}+${user!.specialty}+")).then((value) {
        loadUsers();
      });
     //  users = await databaseHelper.getUsers();
      emit(UserLoaded(users!));
    } catch (e) {
      emit(UserError("Failed to add user"));
    }
  }

  Future<void> updateUser(User upuser) async {
    user=upuser;
    try {
      await databaseHelper.updateUser(user!);
      users = await databaseHelper.getUsers();
      emit(UserLoaded(users!));
    } catch (e) {
      emit(UserError("Failed to update user"));
    }
  }

  Future<void> deleteUser(int id) async {
    try {
      await databaseHelper.deleteUser(id);
      users = await databaseHelper.getUsers();
      emit(UserLoaded(users!));
    } catch (e) {
      emit(UserError("Failed to delete user"));
    }
  }

  Future<void> createdata() async {
   await databaseHelper.initDatabase().then((value){
     emit(CreateuserData());
   });
  }

  bool isadaby=true;
  String Department="ادبي";
  isadabychange(){
    isadaby=!isadaby;
    emit(adaby());
  }

  String Genderq="ذكر";
  bool ismale=true;
  Gender(){
    ismale=!ismale;
    emit(male());
  }

  bool qodorat=false;
  passexam(){
    qodorat=!qodorat;
    emit(pass());
  }


  String? part;
  copm(_sumController){
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
        part="الاقتصاد المنزلي - موسيقي";
      }
      else if(int.parse(_sumController.text)<216){
        part="موسيقي";
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
        part="الاعلام التربوي - الاقتصاد المنزلي - فني";

      }
      else if(int.parse(_sumController.text)<233.5&&int.parse(_sumController.text)>216){
        part="الاعلام التربوي - فني";

      }
      else if(int.parse(_sumController.text)<216&&Gender=="انثي"){
        part="الاعلام التربوي - الاقتصاد المنزلي - فني";

      }

      else{
        part="موسيقي - الاعلام التربوي";
      }

    }
  }
  int current=0;
  void navigateTo(int index) {
    current=index;
    emit(BottomNavigationChanged());
  }
  List<Widget> screens=[
    OptionSelectorScreen(name: CacheHelper.getString(key: "name"),),
    HomeScreen(),
    Doctors(),
    Aboutus(),
  ];
}
