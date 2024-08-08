class User {
  int? id;
  String name;
  String specialty;
  int sum;
  String part="اعرف تخصصك";


  User({this.id, required this.name, required this.specialty, required this.sum,required this.part});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'specialty': specialty,
      'sum': sum,
      "part":part
    };
  }

  User.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        name = map['name'],
        specialty = map['specialty'],
        sum = map['sum'],
        part = map['part'];
}
