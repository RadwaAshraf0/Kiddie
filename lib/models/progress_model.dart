import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kiddie/helper/custom_text.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Progress extends StatefulWidget {
  const Progress({
    super.key,
    required this.percentage,
    this.color,
    this.image,
    this.tcolor,
    required this.score,
    required this.displayTotalScore,
  });

  final int percentage;
  final Color? color;
  final DecorationImage? image;
  final Color? tcolor;
  final int score;
  final bool displayTotalScore;

  @override
  State<Progress> createState() => _ProgressState();
}

class _ProgressState extends State<Progress> {
  final TextEditingController _progressController = TextEditingController();
  final CollectionReference _progressCollection =
      FirebaseFirestore.instance.collection('UserProgress');

  int cumulativeScore = 0;
  int levelScore = 0;

  @override
  void initState() {
    super.initState();
    fetchAndSetLevelScore(widget.score);
  }

  Future<void> fetchAndSetLevelScore(int level) async {
    String? userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId != null) {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('UserProgress')
          .doc(userId)
          .get();
      if (snapshot.exists) {
        setState(() {
          cumulativeScore = snapshot['total_score'] ?? 0;
          if (!widget.displayTotalScore) {
            levelScore = snapshot['level${level}_score'] ?? 0;
          }
        });
      }
    }
  }

  Color _getColorForPercentage(double percentage) {
    if (percentage <= 25) {
      return Colors.red;
    } else if (percentage <= 50) {
      return Colors.orange;
    } else if (percentage <= 75) {
      return Colors.yellow;
    } else {
      return Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    int currentPercentage = widget.displayTotalScore
        ? ((cumulativeScore / 100) * 100).round()
        : ((levelScore / 25) * 100).round();

    int scoreToDisplay = widget.displayTotalScore ? widget.score : levelScore;

    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.04),
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.45,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 2))
                ],
                borderRadius: const BorderRadius.all(Radius.circular(40)),
                color: widget.image == null
                    ? widget.color ?? Colors.black54
                    : null,
                image: widget.image,
              ),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05),
                      Center(
                          child: CustomText(
                              fontSize: 0.09,
                              color: widget.tcolor!,
                              text: "Your progress")),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05),
                      CircularPercentIndicator(
                        radius: MediaQuery.of(context).size.width * 0.2,
                        lineWidth: MediaQuery.of(context).size.width * 0.038,
                        percent: currentPercentage / 100,
                        center: CustomText(
                            fontSize: 0.09,
                            color: widget.tcolor ?? Colors.black,
                            text: '${scoreToDisplay.toString()} %'),
                        backgroundColor: Colors.grey,
                        progressColor: _getColorForPercentage(
                            currentPercentage.toDouble()),
                        circularStrokeCap: CircularStrokeCap.round,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: -5,
                    right: 0,
                    child: Image.asset(
                      'assets/images/profile/progress.png',
                      height: MediaQuery.of(context).size.height * 0.18,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
