import 'dart:convert';

class UserLogin {
  late String Name;
  late String Email;
  late String Password;
  late Roles Role;

  UserLogin(String Name, String Email, String Password, Roles Role) {
    this.Name = Name;
    this.Email = Email;
    this.Password = Password;
    this.Role = Role;
  }

  Object? toJson() {
    return {
      "name": Name,
      "email": Email,
      "password": Password,
      "role": Role.name.toUpperCase()
    };
  }

  factory UserLogin.fromJson(String json) {
    var map = jsonDecode(json);
    print("Map: $map");
    print("Map body: ${map["body"]}");
    print("Map body user: ${map["body"]["user"]}");
    var user = map["body"]["user"];
    return UserLogin(user["name"], user["email"], "12345",
        Roles.values.firstWhere((element) => element.name == user["role"]));
  }
}

enum Roles { STUDENT, ADMIN, TEACHER, MONITOR }
