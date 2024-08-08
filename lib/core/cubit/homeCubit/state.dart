

import '../../../feauters/models/studentmodel.dart';

abstract class UserState {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}
class CreateuserData extends UserState {}


class UserLoaded extends UserState {
  final List<User> users;

  const UserLoaded(this.users);

  @override
  List<Object> get props => [users];
}

class UserError extends UserState {
  final String message;

  const UserError(this.message);

  @override
  List<Object> get props => [message];
}

class adaby extends UserState {}
class male extends UserState {}
class pass extends UserState {}
class BottomNavigationChanged extends UserState {}


