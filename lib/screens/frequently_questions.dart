import 'package:flutter/material.dart';
import 'package:local_dea_app/constraints/colors.dart';
import 'package:local_dea_app/widgets/app_bar_content.dart';
import 'package:local_dea_app/widgets/question.dart';

class FrequentlyQuestionsScreen extends StatefulWidget {
  const FrequentlyQuestionsScreen({Key? key}) : super(key: key);

  @override
  _FrequentlyQuestionsScreenState createState() =>
      _FrequentlyQuestionsScreenState();
}

enum questions { one, two, three, four }

extension QuestionsExt on questions {
  String get text {
    switch (this) {
      case questions.one:
        return 'O que é o DEA?';
      case questions.two:
        return 'Quem pode usar o DEA?';

      case questions.three:
        return 'Como funciona um DEA?';

      case questions.four:
        return 'Os DEAs substituem a RCP?';
    }
  }

  String get answer {
    switch (this) {
      case questions.one:
        return 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse euismod odio lacus. Cras porttitor augue quis odio venenatis pretium. Mauris finibus feugiat dolor sed aliquam. Praesent nibh orci, volutpat at arcu in, venenatis finibus arcu. Donec lectus massa, gravida ac dignissim id, venenatis quis leo. Aenean vestibulum pulvinar nisi eget laoreet. Nam luctus arcu nec ultricies condimentum. Praesent non justo mauris. Sed eget arcu blandit, tincidunt ante tristique, malesuada ligula';
      case questions.two:
        return 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse euismod odio lacus. Cras porttitor augue quis odio venenatis pretium. Mauris finibus feugiat dolor sed aliquam. Praesent nibh orci, volutpat at arcu in, venenatis finibus arcu. Donec lectus massa, gravida ac dignissim id, venenatis quis leo. Aenean vestibulum pulvinar nisi eget laoreet. Nam luctus arcu nec ultricies condimentum. Praesent non justo mauris. Sed eget arcu blandit, tincidunt ante tristique, malesuada ligula';

      case questions.three:
        return 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse euismod odio lacus. Cras porttitor augue quis odio venenatis pretium. Mauris finibus feugiat dolor sed aliquam. Praesent nibh orci, volutpat at arcu in, venenatis finibus arcu. Donec lectus massa, gravida ac dignissim id, venenatis quis leo. Aenean vestibulum pulvinar nisi eget laoreet. Nam luctus arcu nec ultricies condimentum. Praesent non justo mauris. Sed eget arcu blandit, tincidunt ante tristique, malesuada ligula';

      case questions.four:
        return 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse euismod odio lacus. Cras porttitor augue quis odio venenatis pretium. Mauris finibus feugiat dolor sed aliquam. Praesent nibh orci, volutpat at arcu in, venenatis finibus arcu. Donec lectus massa, gravida ac dignissim id, venenatis quis leo. Aenean vestibulum pulvinar nisi eget laoreet. Nam luctus arcu nec ultricies condimentum. Praesent non justo mauris. Sed eget arcu blandit, tincidunt ante tristique, malesuada ligula';
    }
  }
}

class _FrequentlyQuestionsScreenState extends State<FrequentlyQuestionsScreen> {
  questions? questionSelected;

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
          itemCount: questions.values.length,
          itemBuilder: (_, index) {
            final question = questions.values[index];
            return QuestionWidget(
              isSelected: questionSelected == question,
              title: question.text,
              answer: question.answer,
              onTap: () {
                setState(() {
                  if (questionSelected == question) {
                    questionSelected = null;
                  } else {
                    questionSelected = question;
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
