import 'package:bug_slayer/Question.dart';
import 'package:bug_slayer/QuestionDetail.dart';
import 'package:bug_slayer/databaseHelper.dart';
import 'package:flutter/material.dart';

class QuestList extends StatefulWidget {
  @override
  State<QuestList> createState() => _QuestListState();
}

class _QuestListState extends State<QuestList> {
  // DatabaseHelper databaseHelper = DatabaseHelper();
  List<Question> questionList = getquests();
  int count = 3;
  @override

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: count,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(5),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Chip(
                      label: Text(
                        questionList[index].name,
                        style: const TextStyle(fontSize: 16),
                      ),
                      avatar: const Icon(Icons.person),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(questionList[index].job),
                  ),
                  const Divider(),
                  Text(questionList[index].theQuest,
                      maxLines: 4, style: const TextStyle(fontSize: 18)),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return QuestionDetail(questionList[index]);
                          },
                        ));
                      },
                      child: const Text("See Details"))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

List<Question> getquests() {
  List<Question> result = <Question>[];
  result.add(Question(
      "Yohannes",
      "Software Engineer",
      "I googled it, searched on StackOverflow, looked through the reference box on regex101, but didn't find anything that could help. I am wondering whether I could write a regex that would, for instance, break up the String \"122233444444666\" into these tokens: \"1\", \"222\", \"33\", \"444444\", and \"666\". Is it possible with regex tools?",
      "+251906348594"));
  result.add(Question(
      "Bill",
      "Data Analyst",
      "I have 3 services which do different sorts of operations i.e. every service is different from the other."
          "I have to create a main orchestrator that will invoke these services based on some values which are stored in the configuration class which are of type boolean and are read from the application.properties file."
          "For example: If propertyForService1 is true, then the orchestrator should only execute service1 , and service2 and service3 should not be executed."
          "If propertyForService2 and propertyForService3 are true, then service1 should not be executed and service2 and service3 should be executed in a way that service2 gets firstly executed, and after it finishes service3 should be executed."
          "With that said, the orchestrator should be open for future modifications like adding/removing services."
          "I know its a little bit of abstract, hope it explained the problem which is trying to be solved",
      "+251984489339"));
  result.add(Question(
      "Abrham",
      "Student",
      "I would like to create reusable component which will be form with questions true/false where questions are as input. On start I did interface which will be like structure of my form: export interface QuestionFormData { cancelButtonLabel: string; submitButtonLabel: string; titleOfForm: string; questions: Question[]; }"
          "Question is interface too: export interface Question { content: string; answers: {key: string, value: any}[]; isFieldRequired: boolean; nameOfField: string; }"
          "And next in ParentController I did method and added it to onClick event on button: `openQuestionForm() { const dialogRef = this.dialogWindow.open(FormComponent, { width: ... height: ..."
          "data: { titleOfForm: 'TITLE', cancelButtonLabel: 'CANCEL', confirmButtonLabel: 'SUBMIT', questions: [ { content: 'question one', answers: ... isFieldRequired: true; nameOfField: 'name1' }, { content: 'question two', answers: ... isFieldRequired: true; nameOfField: 'name2' }] }; });",
      "+251597636735"));

  return result;
}
