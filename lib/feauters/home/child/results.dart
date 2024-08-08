import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:final_project/core/dataHelper/localData.dart';
import 'package:final_project/feauters/reuseable/reuse.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/cubit/homeCubit/cubit.dart';
import '../../../core/cubit/homeCubit/state.dart';
import '../../models/studentmodel.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _specialtyController = TextEditingController();
  final TextEditingController _sumController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit,UserState>(
        listener: (context,state){},
        builder: (context,state){
          var cubit=context.read<UserCubit>();
          return ConditionalBuilder(
              condition: cubit.users.isEmpty,
              builder: (context)=>Center(child: CircularProgressIndicator(color: Colors.teal,),),
              fallback: (context)=>ListView.builder(itemBuilder:(context,index){
                return AwesomeCard(user:cubit.users![index],);
              },
                itemCount: cubit.users?.length,
              )
          );
        },

    );
  }
}
