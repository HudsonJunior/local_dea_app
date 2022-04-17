import 'package:flutter/material.dart';
import 'package:local_dea_app/definitions/colors.dart';
import 'package:local_dea_app/definitions/frequently_questions_data.dart';
import 'package:local_dea_app/widgets/app_bar_content.dart';
import 'package:local_dea_app/widgets/field.dart';
import 'package:local_dea_app/widgets/question.dart';

class FrequentlyQuestionsScreen extends StatefulWidget {
  const FrequentlyQuestionsScreen({Key? key}) : super(key: key);

  @override
  _FrequentlyQuestionsScreenState createState() =>
      _FrequentlyQuestionsScreenState();
}

class _FrequentlyQuestionsScreenState extends State<FrequentlyQuestionsScreen> {
  int? questionSelected;

  late final TextEditingController searchController;
  late List<FrequentlyQuestionModel> _data;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController()
      ..addListener(() {
        if (searchController.text.isEmpty) {
          setState(() {
            _data = frequentlyQuestionsData;
          });
        } else {
          setState(() {
            _data = frequentlyQuestionsData
                .where(
                  (item) => item.question.toUpperCase().contains(
                        searchController.text.toUpperCase(),
                      ),
                )
                .toList();
          });
        }
      });
    _data = frequentlyQuestionsData;
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.primary,
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
                foregroundColor: Colors.white,
                floating: true,
                snap: true,
                expandedHeight: kTextTabBarHeight * 2 + 50,
                backgroundColor: Palette.primary,
                title: const AppBarContent(
                  title: 'Perguntas frequentes',
                ),
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  stretchModes: const [StretchMode.fadeTitle],
                  background: Padding(
                    padding: const EdgeInsets.only(
                      left: 8.0,
                      right: 8.0,
                      top: kTextTabBarHeight * 2,
                    ),
                    child: CustomFormField(
                      icon: Icons.search,
                      label: '',
                      hintText: 'Pesquisar',
                      controller: searchController,
                    ),
                  ),
                )),
            if (_data.isEmpty)
              const SliverToBoxAdapter(
                child: Text(
                  'Não foi encontrado nenhuma pergunta.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
            if (_data.isNotEmpty)
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (_, index) {
                    final question = _data[index];
                    return QuestionWidget(
                      isSelected: questionSelected == index,
                      title: question.question,
                      answer: question.answer,
                      onTap: () {
                        FocusScope.of(context).unfocus();
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
                  childCount: _data.length,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
