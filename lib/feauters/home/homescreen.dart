import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/cubit/homeCubit/cubit.dart';
import '../../core/cubit/homeCubit/state.dart';
import '../../core/dataHelper/localData.dart';
import '../constants/constants.dart';

class HomeMain extends StatelessWidget {
  const HomeMain({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child : BlocConsumer<UserCubit,UserState>(
        listener: (context,state){},
    builder: (context,state) {
      return Scaffold(
        appBar: AppBar(
          leading: null,
          automaticallyImplyLeading: false, // Set to false to remove the back button
          title: Text("hi bro"),
        ),
        body: context
            .read<UserCubit>()
            .screens[context
            .read<UserCubit>()
            .current],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home,color:mainColor,), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.search,color: mainColor), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.account_circle,color : mainColor), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.info,color: mainColor), label: ""),
          ],
          currentIndex: context
              .read<UserCubit>()
              .current,
          onTap: (index) {
            context.read<UserCubit>().navigateTo(index);
          },
        ),
      );
    }
        )
    );
  }
}
