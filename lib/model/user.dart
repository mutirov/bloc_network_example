class User {
  int id;
  String name;
  String? email;
  String? phone;

  User({required this.id, required this.name, this.email, this.phone});

  factory User.fromMap(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] != null ? json['email'] as String : null,
      phone: json['phone'] != null ? json['phone'] as String : null,
    );
  }

  // Map<String, dynamic> toMap() {
  //   return <String, dynamic>{
  //     'id': id,
  //     'name': name,
  //     'mail': mail,
  //     'phone': phone,
  //   };
  // }
}
