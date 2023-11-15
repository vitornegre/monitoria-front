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
}

enum Roles { STUDENT, ADMIN, PROFESSOR, MONITOR }
