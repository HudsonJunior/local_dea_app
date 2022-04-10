import 'package:flutter/material.dart';
import 'package:local_dea_app/definitions/colors.dart';
import 'package:local_dea_app/definitions/frequently_questions_data.dart';
import 'package:local_dea_app/widgets/app_bar_content.dart';
import 'package:local_dea_app/widgets/question.dart';

class FrequentlyQuestionsScreen extends StatefulWidget {
  const FrequentlyQuestionsScreen({Key? key}) : super(key: key);

  @override
  _FrequentlyQuestionsScreenState createState() =>
      _FrequentlyQuestionsScreenState();
}

class _FrequentlyQuestionsScreenState extends State<FrequentlyQuestionsScreen> {
  int? questionSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.primary,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Palette.primary,
        title: const AppBarContent(
          title: 'Perguntas Frequentes',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ListView.separated(
          separatorBuilder: (_, __) => const SizedBox(height: 16),
          itemCount: frequentlyQuestionsData.length,
          itemBuilder: (_, index) {
            final question = frequentlyQuestionsData[index];
            return QuestionWidget(
              isSelected: questionSelected == index,
              title: question.entries.elementAt(0).key,
              answer: question.entries.elementAt(0).value,
              onTap: () {
                setState(() {
                  if (questionSelected == index) {
                    questionSelected = null;
                  } else {
                    questionSelected = index;
                  }
                });
              },
            );
          },
        ),
      ),
    );
  }
}
