class Answer {
  late String exercise_id;
  late String email;
  late String content;
  late int is_right;

  Answer(String exercise_id, String email, String content, int is_right) {
    this.exercise_id = exercise_id;
    this.email = email;
    this.content = content;
    this.is_right = is_right;
  }
}
