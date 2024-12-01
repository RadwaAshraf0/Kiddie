import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kiddie/components/answer_card.dart';
import 'package:kiddie/models/progress_model.dart';
import 'package:kiddie/components/question.dart';
import 'package:kiddie/helper/custom_text.dart';
import 'package:kiddie/models/Button/custom_button.dart';

class QuizModel extends StatefulWidget {
  final List<Question> questions;
  final int level; // المستوى
  final int score;

  const QuizModel(
      {super.key,
      required this.questions,
      required this.level,
      required this.score});

  @override
  State<QuizModel> createState() => _QuizModelState();
}

class _QuizModelState extends State<QuizModel> {
  int? selectedAnswerIndex;
  int questionIndex = 0;
  int percentage = 0;
  bool isButtonLoading = false;

  void pickAnswer(int value) {
    setState(() {
      selectedAnswerIndex = value;
      final question = widget.questions[questionIndex];
      if (selectedAnswerIndex == question.correctAnswerIndex) {
        percentage += 1;
      }
    });
  }

  void goToNextQuestion() {
    if (questionIndex < widget.questions.length - 1) {
      setState(() {
        questionIndex++;
        selectedAnswerIndex = null;
      });
    }
  }

  Future<void> _saveLevelScore() async {
    String? userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId != null) {
      try {
        int finalScore = ((percentage / widget.questions.length) * 25).round();

        await FirebaseFirestore.instance
            .collection('UserProgress')
            .doc(userId)
            .update({
          'level${widget.level}_score': finalScore,
        });

        DocumentSnapshot snapshot = await FirebaseFirestore.instance
            .collection('UserProgress')
            .doc(userId)
            .get();
        int totalScore = 0;
        int maxLevel = 4;
        for (int i = 1; i <= maxLevel; i++) {
          totalScore += (snapshot.get('level${i}_score') as int?) ?? 0;
        }
        await FirebaseFirestore.instance
            .collection('UserProgress')
            .doc(userId)
            .update({
          'total_score': totalScore,
        });
        print(
            "Score for level ${widget.level} saved, and total score updated!");
      } catch (e) {
        print("Error saving score: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.questions.isEmpty) {
      return const Center(child: Text("No questions available."));
    }

    final Question question = widget.questions[questionIndex];

    if (question.options.isEmpty) {
      return const Center(
          child: Text("No options available for this question."));
    }

    bool isLastQuestion = questionIndex == widget.questions.length - 1;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          question.question,
          style: const TextStyle(fontSize: 21),
          textAlign: TextAlign.center,
        ),
        ListView.builder(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
          shrinkWrap: true,
          itemCount: question.options.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap:
                  selectedAnswerIndex == null ? () => pickAnswer(index) : null,
              child: AnswerCard(
                currentIndex: index,
                question: question.options[index],
                isSelected: selectedAnswerIndex == index,
                selectedAnswerIndex: selectedAnswerIndex,
                correctAnswerIndex: question.correctAnswerIndex,
              ),
            );
          },
        ),
        isLastQuestion
            ? CustomButton(
                onPressed: () async {
                  setState(() {
                    isButtonLoading = true;
                  });
                  await _saveLevelScore();
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (_) => Progress(
                        tcolor: Colors.black,
                        percentage: percentage,
                        image: const DecorationImage(
                          image:
                              AssetImage("assets/images/firstPages/paper.jpg"),
                          fit: BoxFit.cover,
                        ),
                        score: widget.score,
                        displayTotalScore: false,
                      ),
                    ),
                  );
                  setState(() {
                    isButtonLoading = false;
                  });
                },
                color: const Color.fromARGB(201, 1, 1, 1),
                height: MediaQuery.of(context).size.height * 0.0001,
                width: MediaQuery.of(context).size.width * 0.0013,
                text: isButtonLoading
                    ? const CircularProgressIndicator(color: Colors.black)
                    : const CustomText(
                        fontSize: 0.09,
                        color: Colors.white70,
                        text: "Finish",
                      ),
              )
            : CustomButton(
                onPressed:
                    selectedAnswerIndex != null ? goToNextQuestion : null,
                color: const Color.fromARGB(201, 1, 1, 1),
                height: MediaQuery.of(context).size.height * 0.0001,
                width: MediaQuery.of(context).size.width * 0.0013,
                text: const CustomText(
                  fontSize: 0.09,
                  color: Colors.white70,
                  text: "Next",
                ),
              ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.0001,
        )
      ],
    );
  }
}
