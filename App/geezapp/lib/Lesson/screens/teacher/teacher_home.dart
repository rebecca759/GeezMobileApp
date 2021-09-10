import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geezapp/Questions/bloc/question_bloc.dart';
import 'package:geezapp/Questions/bloc/question_events.dart';
import 'package:geezapp/Questions/bloc/question_states.dart';
import 'package:geezapp/enums.dart';
import 'package:geezapp/profile/profile_screen/screens/profile_screen.dart';
import 'package:geezapp/Lesson/screens/teacher/teacher_create.dart';

void main() => runApp(const TeacherHome());

/// This is the main application widget.
class TeacherHome extends StatelessWidget {
  static const String routeName = '/teacher';
  const TeacherHome({Key? key}) : super(key: key);

  static const String _title = 'መግቢያ';
  static const primaryColor = const Color(0xFFD55555);

  @override
  Widget build(BuildContext context) {
    final questionBloc = BlocProvider.of<QuestionBloc>(context);

    const utype = 'teacher';
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.home),
        title: const Text(_title),
        backgroundColor: primaryColor,
      ),
      body: HomeLessons(),
      bottomNavigationBar:
          CustomNavBar(selectedMenu: MenuState.home, utype: "teacher"),
    );
  }
}

class HomeLessons extends StatelessWidget {
  const HomeLessons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 1,
      childAspectRatio: 2,
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(15.0, 3.0, 15.0, 3.0),
          margin: const EdgeInsets.fromLTRB(10, 20, 40, 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.green[50],
          ),
          child: Text('ንዑስ ርዕሶች',
              style: TextStyle(color: Colors.black, fontSize: 17)),
        ),

        Container(
          height: 200.0,
          child: ListView(
            padding: const EdgeInsets.all(10.0),
            scrollDirection: Axis.horizontal,
            children: [
              Container(
                width: 130.0,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.deepOrange[100]),
                child: Stack(
                  overflow: Overflow.visible,
                  children: [
                    Positioned(
                      top: 20,
                      left: 10,
                      child: Stack(children: [
                        Text('Course Title',
                            style: TextStyle(color: Colors.grey[700])),
                      ]),
                    ),
                    Positioned(
                      bottom: 20,
                      right: 20,
                      child: Text('lesson 2',
                          style: TextStyle(color: Colors.grey[500])),
                    )
                  ],
                ),
              ),
              ///////////
            ],
          ),
        ),

        Container(
          //width: 70.0,
          padding: const EdgeInsets.fromLTRB(15.0, 3.0, 40.0, 3.0),
          margin: const EdgeInsets.fromLTRB(10, 20, 40, 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.green[50],
          ),
          child: Text('ፈተናዎች',
              style: TextStyle(color: Colors.black, fontSize: 17)),
        ),

        BlocBuilder<QuestionBloc, QuestionState>(builder: (_, questionState) {
          if (questionState is LoadQuestionsById) {
            return CircularProgressIndicator();
          }
          if (questionState is QuestionOperationFailure) {
            return Text("loading qusetion failed");
          }
          if (questionState is QuetionOperationSuccess) {
            final questions = questionState.question;
            return ListView.builder(
                itemCount: questions.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, int index) {
                  return Container(
                    height: 100.0,
                    width: 100.0,
                    margin: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.pink[800]),
                    child: ListTile(
                      title: Text('${questions.elementAt(index).question}',
                          style: TextStyle(color: Colors.grey[100])),
                      subtitle: Text('${questions.elementAt(index).level_id}',
                          style: TextStyle(color: Colors.grey[50])),
                    ),
                  );
                });
          }
          return Container();
        })
        //
      ],
    );
  }
}
