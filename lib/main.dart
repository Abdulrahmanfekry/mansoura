import 'package:final_project/core/dataHelper/cache_helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/cubit/homeCubit/cubit.dart';
import 'core/dataHelper/localData.dart';
import 'feauters/auth/registration.dart';
import 'feauters/auth/signup.dart';
import 'feauters/intro/introScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyCsYkFPNMD4VdNm3hFlHr_udnJ1fzuBpgo",
          appId: "1:398182262460:android:ca026a3eccda0c17cd12b9",
          messagingSenderId: "398182262460",
          projectId: "finalproject-b5ccd"
      )
  );
  await CacheHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserCubit>(create: (_) => UserCubit(DatabaseHelper())..loadUsers()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          brightness: Brightness.light,
          textTheme: TextTheme(

          )
        ),
        home: CacheHelper.getBoolean(key: "login")==true?IntroScreen():const WelcomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

