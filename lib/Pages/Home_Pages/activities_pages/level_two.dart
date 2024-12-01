import 'package:flutter/material.dart';
import 'package:kiddie/models/quiz_model.dart';
import '../../../components/questions.dart';
import '../../../helper/background_image.dart';
import '../../../helper/custom_text.dart';

class LevelTwo extends StatelessWidget {
  LevelTwo({super.key});
  static String id = 'levelTwo';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: BackgroundImage(
        child: Column(children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.05),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                      fontSize: 0.2, color: Colors.black, text: 'Level 2'),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: QuizModel(
              questions: level2Questions,
              level: 2,
              score: 2,
            ),
          ),
        ]),
      ),
    );
  }
}
