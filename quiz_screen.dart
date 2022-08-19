import 'package:flutter/material.dart';
import './questions.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<Question> questionlist = getQuestion();
  int currentQuestionIndex = 0;
  int score = 0;
  Answer? selectedAnswer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 85, 71, 157),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Column(children: [
          const Text(
            "Easy vragen quiz",
            style: TextStyle(
              color: Colors.purple,
              fontSize: 24,
            ),
          ),
          _questionWidget(),
          _answerList(),
        ]),
      ),
    );
  }

  _questionWidget() {
    return Column(children: [
      Text(
        "Question ${currentQuestionIndex + 1}/${questionlist.length.toString()}",
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      const SizedBox(height: 20),
      Text(
        questionlist[currentQuestionIndex].questionText,
          style: const TextStyle(
            color: Colors.white,
          ))
    ]);
  }

  _answerList(){
    return Column(
      children: questionlist[currentQuestionIndex];

}
