class Exercise {
  late String ExerciseId;
  late String Title;
  late String Enunciado;
  late int CreationDateInMiliseconds;
  late int ExpirationDateInMilisecond;
  late String CorrectAnswer;

  Exercise(
    this.ExerciseId,
    this.CorrectAnswer,
    this.Title,
    this.Enunciado,
    this.CreationDateInMiliseconds,
    this.ExpirationDateInMilisecond,
  );
}
