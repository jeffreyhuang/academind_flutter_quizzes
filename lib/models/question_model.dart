class QuestionModel {
  const QuestionModel(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    final answerList = List.of(answers);
    answerList.shuffle();
    return answerList;
  }
}
