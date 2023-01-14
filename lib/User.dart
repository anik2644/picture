class User {


  late final String name;
  late final String email;

  User(this.name, this.email);

  // User.fromJson(Map<String, dynamic> json)
  //     : name = json['name'],
  //       email = json['email'];

  User.fromJson(Map<String,dynamic> json)
  {
    this.name= json['name'];
    this.email= json['email'];
  }


  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
  };
}