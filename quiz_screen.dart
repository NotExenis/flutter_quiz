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
          _nextButton(),
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
      Text(questionlist[currentQuestionIndex].questionText,
          style: const TextStyle(
            color: Colors.white,
          ))
    ]);
  }

  _answerList() {
    return Column(
      children: questionlist[currentQuestionIndex]
          .answerList
          .map(
            (e) => _answerButton(e),
          )
          .toList(),
    );
  }

  Widget _answerButton(Answer answer) {
    bool isSelected = answer == selectedAnswer;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8),
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            primary: isSelected ? Colors.blue : Colors.white,
            onPrimary: isSelected ? Colors.white : Colors.black),
        onPressed: () {
          if (selectedAnswer == null) {
            if (answer.isCorrect) {
              score++;
            }

            setState(
              () {
                selectedAnswer = answer;
              },
            );
          }
        },
        child: Text(answer.answerText),
      ),
    );
  }

  _nextButton() {
    bool isLastQuestion = false;
    if (currentQuestionIndex == questionlist.length - 1) {
      isLastQuestion = true;
    }

    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            primary: Colors.redAccent,
            onPrimary: Colors.white),
        onPressed: () {
          if (isLastQuestion) {
            showDialog(context: context, builder: (_) => _showScoreDialog());
          } else {
            setState(() {
              selectedAnswer = null;
              currentQuestionIndex++;
            });
          }
        },
        child: Text(isLastQuestion ? "submit" : "Next"),
      ),
    );
  }

  _showScoreDialog() {
    bool isPassed = false;
    if (score >= questionlist.length * 0.6) {
      isPassed = true;
    }
    String title = isPassed ? "Passed" : "Failed";
    return AlertDialog(
      title: Text(
        "$title | Score is $score",
      ),
      content: ElevatedButton(
          child: const Text('Restart'),
          onPressed: () {
            setState(() {
              Navigator.pop(context);
              currentQuestionIndex = 0;
              score = 0;
              selectedAnswer = null;
            });
          }),
    );
  }
}
