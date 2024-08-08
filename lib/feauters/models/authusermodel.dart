class UserModel {
  final String uid;
  final String email;

  UserModel({required this.uid, required this.email});

  @override
  List<Object?> get props => [uid, email];
}
