class Question {
  final String questionText;
  final List<Answer> answerList;

  Question(this.questionText, this.answerList);
}

class Answer {
  final String answerText;
  final bool isCorrect;

  Answer(this.answerText, this.isCorrect);
}

List<Question> getQuestion() {
  List<Question> list = [];

  list.add(
    Question(
      "Wie is de eigenaar van Flutter?",
      [
        Answer("Nokia", false),
        Answer("Samsung", false),
        Answer("Google", true),
        Answer("Apple", false),
      ],
    ),
  );

  list.add(
    Question(
      "Wie maakt IOS?",
      [
        Answer("Nokia", false),
        Answer("Samsung", false),
        Answer("Google", false),
        Answer("Apple", true),
      ],
    ),
  );

  list.add(
    Question(
      "Wie is de rijkste man op aarde?",
      [
        Answer("Elon Musk", true),
        Answer("Jeff Bezos", false),
        Answer("Bill Gates", false),
        Answer("Bernard Arnault", false),
      ],
    ),
  );

  list.add(
    Question(
      "Van wie is SpaceX?",
      [
        Answer("Elon Musk", true),
        Answer("Jeff Bezos", false),
        Answer("Bill Gates", false),
        Answer("Bernard Arnault", false),
      ],
    ),
  );

  list.add(
    Question(
      "Van wie is Tesla?",
      [
        Answer("Elon Musk", true),
        Answer("Jeff Bezos", false),
        Answer("Bill Gates", false),
        Answer("Bernard Arnault", false),
      ],
    ),
  );


  return list;
}
