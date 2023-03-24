import 'package:bug_slayer/Question.dart';
import 'package:flutter/material.dart';

class QuestionDetail extends StatefulWidget {
  final quest;
  QuestionDetail(this.quest);
  @override
  State<QuestionDetail> createState() => _QuestionDetailState(quest);
}

class _QuestionDetailState extends State<QuestionDetail> {
  final quest;
  _QuestionDetailState(this.quest);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Question Detail"),
      ),
      body: QuestDetail(quest),
    );
  }
}

class QuestDetail extends StatefulWidget {
  final quest;
  QuestDetail(this.quest);
  @override
  State<QuestDetail> createState() => _QuestDetailState(quest);
}

class _QuestDetailState extends State<QuestDetail> {
  Question quest;
  _QuestDetailState(this.quest);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ListView(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Chip(
              label: Text(
                quest.name,
                style: TextStyle(fontSize: 16),
              ),
              avatar: Icon(Icons.person),
            ),
          ),
          // ignore: unnecessary_const
          Align(
            alignment: Alignment.topLeft,
            child: Text(quest.job),
          ),
          Divider(),
          Text(quest.theQuest, maxLines: 100, style: TextStyle(fontSize: 18)),
          Padding(
              padding: EdgeInsets.all(40),
              child: Text(
                "Contact : ${quest.phone}",
                style: TextStyle(fontSize: 20),
              )),
        ],
      ),
    );
  }
}
