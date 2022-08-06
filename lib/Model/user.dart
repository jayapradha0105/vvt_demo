class User{
  String? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  User({this.id, this.email, this.firstName, this.lastName, this.avatar});

  factory User.fromJson(Map<String, dynamic> parsedJson) {
    return User(
      id: parsedJson['id'].toString(),
      email: parsedJson['email'],
      firstName: parsedJson['first_name'],
      lastName: parsedJson['last_name'],
      avatar: parsedJson['avatar']
    );
  }
}