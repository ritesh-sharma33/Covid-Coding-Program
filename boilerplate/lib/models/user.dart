
class User {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  User({this.id, this.email, this.firstName, this.lastName, this.avatar});

  factory User.fromJSON(Map<String, dynamic> json) {
    return User(
      id: json["id"],
      email: json["email"],
      firstName: json["first_name"],
      lastName: json["last_name"],
      avatar: json["avatar"]
    );
  }
}