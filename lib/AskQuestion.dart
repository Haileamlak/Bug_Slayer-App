import 'package:bug_slayer/databaseHelper.dart';
import 'package:flutter/material.dart';
import 'Question.dart';

class QuestInput extends StatefulWidget {
  @override
  State<QuestInput> createState() => _QuestInputState();
}

class _QuestInputState extends State<QuestInput> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ask Question"),
      ),
      body: QuestionInput(),
    );
  }
}

class QuestionInput extends StatefulWidget {
  @override
  State<QuestionInput> createState() => _QuestionState();
}

class _QuestionState extends State<QuestionInput> {
  DatabaseHelper db = DatabaseHelper();
  final nameController = TextEditingController();
  final jobController = TextEditingController();
  final questController = TextEditingController();
  final phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.all(10),
          child: TextField(
            controller: nameController,
            decoration: InputDecoration(
                label: const Text("Name"),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: TextField(
            controller: jobController,
            decoration: InputDecoration(
                label: const Text("Job"),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: TextField(
            controller: phoneController,
            decoration: InputDecoration(
                label: const Text("Phone Number"),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: TextField(
            controller: questController,
            minLines: 5,
            maxLines: 10,
            decoration: InputDecoration(
                label: const Text("Your Question"),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
          ),
        ),
        ButtonBar(
          children: [
            ElevatedButton(
              onPressed: () {
                db.insertQuestion(Question(
                    nameController.text,
                    jobController.text,
                    questController.text,
                    phoneController.text));
                Navigator.pop(context);
              },
              child: const Text("Ask"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancel"),
            )
          ],
        )
      ],
    );
  }
}
