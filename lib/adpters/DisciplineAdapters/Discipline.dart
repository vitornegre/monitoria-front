class Discipline {
  late String Name;
  late String disciplineID;
  late int Year;
  late List<String> StudentsEmailsList;

  Discipline(String name, String disciplineID, int year,
      List<String> studentsEmailsList) {
    this.Name = name;
    this.disciplineID = disciplineID;
    this.Year = year;
    this.StudentsEmailsList = studentsEmailsList;
  }

  Object? toJson() {
    return {
      "name": Name,
      "year": Year,
      "students_emails_list": StudentsEmailsList
    };
  }
}
