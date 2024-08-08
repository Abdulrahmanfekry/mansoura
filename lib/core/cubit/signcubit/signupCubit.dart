

// حالات المصادقة


// Cubit للمصادقة
import 'package:final_project/core/cubit/signcubit/signupstate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../feauters/models/authusermodel.dart';
import '../../dataHelper/internetdata.dart';

class AuthCubit extends Cubit<AuthState> {
  final FirebaseHelper authHelper;

  AuthCubit(this.authHelper) : super(AuthInitial());

  Future<void> signUp(String email, String password) async {
    print("signInsignInsignInsignInsignInsignInsignInsignInsignInsignInsignInsignInsignInsignInsignInsignInsignInsignInsignInsignIn");

    emit(AuthLoading());

       await authHelper.signUp(email, password).then((value) {
         emit(AuthAuthenticated());

       }).catchError((onError){
         print(onError.toString());
         emit(AuthError("sdgsdfsdfsdfsdfsdfsdfsdfsdfsdf"));
       });

  }

  Future<void> signIn(String email, String password) async {
    print("signInsignInsignInsignInsignInsignInsignInsignInsignInsignInsignInsignInsignInsignInsignInsignInsignInsignInsignInsignIn");
    emit(AuthLoading());
      await authHelper.signIn(email, password).then((value){
        emit(AuthAuthenticated());
      }).catchError((onError){
        emit(AuthError("sdgsdfsdfsdfsdfsdfsdfsdfsdfsdf"));

      });
   
  
  }

  Future<void> signOut() async {
    await authHelper.signOut();
    emit(AuthInitial());
  }
}
