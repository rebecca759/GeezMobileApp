import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geezapp/Lesson/blocs/blocs.dart';
import 'package:geezapp/Lesson/models/models.dart';
import 'package:geezapp/Lesson/screens/admin/details.dart';
import 'package:geezapp/Lesson/screens/admin/details_page_exam.dart';
import 'package:geezapp/Lesson/screens/admin/details_page_lesson.dart';
import 'package:geezapp/Questions/bloc/question_bloc.dart';
import 'package:geezapp/Questions/bloc/question_events.dart';
import 'package:geezapp/Questions/bloc/question_states.dart';

class Admin extends StatefulWidget {
  @override
  _SimpleAppBarPageState createState() => _SimpleAppBarPageState();
}

class _SimpleAppBarPageState extends State<Admin>
    with TickerProviderStateMixin {
  late var lessonList;
  late var questionList;
  late TabController controller;

  @override
  void initState() {
    BlocProvider.of<LessonBloc>(context).add(LessonLoad('pending'));
    super.initState();
    controller = TabController(vsync: this, length: 3);
    controller.addListener(() {
      if (controller.index == 0) {
        BlocProvider.of<LessonBloc>(context).add(LessonLoad('pending'));
      } else if (controller.index == 1) {
        BlocProvider.of<LessonBloc>(context).add(LessonLoad('approved'));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final questionBloc = BlocProvider.of<QuestionBloc>(context);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("አድሚን"),

          //centerTitle: true,

          //backgroundColor: Colors.purple,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              color: Color(0xFFCAB5BF),
            ),
          ),
          bottom: TabBar(
            //isScrollable: true,
            indicatorColor: Colors.white,
            indicatorWeight: 5,
            tabs: [
              Tab(text: 'ዝርዝር'),
              Tab(text: 'ትምህርቶች'),
              Tab(text: 'ፈተና'),
            ],
            controller: controller,
          ),
          elevation: 20,
          titleSpacing: 20,
          shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30))),
        ),
        body: TabBarView(
          controller: controller,
          children: [
            BlocBuilder<LessonBloc, LessonState>(
              builder: (_, lessonState) {
                if (lessonState is LessonLoading) {
                  return SizedBox(
                      height: 10,
                      width: 10,
                      child: CircularProgressIndicator());
                }
                if (lessonState is LessonOperationFailure) {
                  return Text("loading lessons failed");
                }
                if (lessonState is LessonOperationSuccess) {
                  final lessons = lessonState.lessons;
                  return ListView.builder(
                    itemCount: lessons.length,
                    itemBuilder: (_, int index) {
                      return Center(
                        child: GestureDetector(
                          onTap: () {
                            BlocProvider.of<LessonBloc>(context).add(
                                LoadLessonContent(lessons.elementAt(index)));
                            Navigator.pushNamed(context, DetailPage.routeName);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(12)),
                            padding: EdgeInsets.all(10.0),
                            margin: EdgeInsets.all(10.0),
                            child: ListTile(
                                title: Text(
                                    '${lessons.elementAt(index).lessonName}'),
                                subtitle: Text(
                                    'የአስተማሪ ስም : ${lessons.elementAt(index).teacher_name}'),
                                trailing: IconButton(
                                  icon: Icon(Icons.arrow_forward),
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, DetailPage.routeName);
                                  },
                                )),
                          ),
                        ),
                      );
                    },
                  );
                }
                return Container();
              },
            ),
            BlocBuilder<LessonBloc, LessonState>(builder: (_, lessonState) {
              if (lessonState is LessonLoading) {
                return SizedBox(
                    height: 10, width: 10, child: CircularProgressIndicator());
              }
              if (lessonState is LessonOperationSuccess) {
                final lessons = lessonState.lessons;
                return ListView.builder(
                  itemCount: lessons.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Center(
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(12)),
                        padding: EdgeInsets.all(10.0),
                        margin: EdgeInsets.all(10.0),
                        child: ListTile(
                          title: Text('${lessons.elementAt(index).lessonName}'),
                          subtitle: Text(
                              'የአስተማሪ ስም : ${lessons.elementAt(index).teacher_name}'),
                          trailing: IconButton(
                            onPressed: () {
                              BlocProvider.of<LessonBloc>(context).add(
                                  LessonDelete(
                                      lessons.elementAt(index).lesson_id!));
                            },
                            icon: Icon(
                              Icons.delete,
                              color: Color(0xFFB751623),
                            ),
                          ),
                          onTap: () {
                            BlocProvider.of<LessonBloc>(context).add(
                                LoadLessonContent(lessons.elementAt(index)));
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DetailPagelesson(index)));
                          },
                        ),
                      ),
                    );
                  },
                );
              }
              return Container();
            }),

            /////
            BlocBuilder<QuestionBloc, QuestionState>(
                builder: (_, questionState) {
              print(questionState);
              if (questionState is LoadOldQuestions) {
                return CircularProgressIndicator();
              }
              if (questionState is QuestionOperationFailure) {
                return Text("loading qusetion failed");
              }
              if (questionState is QuetionOperationSuccess) {
                final questions = questionState.question;
                return ListView.builder(
                  itemCount: questions.length,
                  itemBuilder: (_, int index) {
                    return Center(
                      child: GestureDetector(
                        onTap: () {
                          BlocProvider.of<QuestionBloc>(context).add(
                                LoadQuestionContent(questions.elementAt(index)));
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DetailPageQuestion(index)));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(12)),
                          padding: EdgeInsets.all(10.0),
                          margin: EdgeInsets.all(10.0),
                          //////////////////////////
                          // needs a gesture detectotr to open the update UI
                          // and pass the question by creating an event
                          // fetch the quetion again and pass it
                          /////////////////////////
                          child: ListTile(
                              title: Text(
                                  '${questions.elementAt(index).question}'),
                              subtitle: Text(
                                  'ደረጃ : ${questions.elementAt(index).level_id}'),
                              trailing: IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {
                                  BlocProvider.of<QuestionBloc>(context).add(
                                      DeleteQuestion(questions
                                          .elementAt(index)
                                          .question_id!));
                                },
                              )),
                        ),
                      ),
                    );
                  },
                );
              }
              return Container();
            })

            ///
            // BlocBuilder<LessonBloc, LessonState>(builder: (_, lessonState) {
            //   if (lessonState is LessonLoading) {
            //     return SizedBox(
            //         height: 10, width: 10, child: CircularProgressIndicator());
            //   }
            //   if (lessonState is LessonOperationSuccess) {
            //     final lessons = lessonState.lessons;
            //     return ListView.builder(
            //       itemCount: lessons.length,
            //       itemBuilder: (BuildContext context, int index) {
            //         return Center(
            //           child: Container(
            //             decoration: BoxDecoration(
            //                 border: Border.all(
            //                   color: Colors.grey,
            //                   width: 1,
            //                 ),
            //                 borderRadius: BorderRadius.circular(12)),
            //             padding: EdgeInsets.all(10.0),
            //             margin: EdgeInsets.all(10.0),
            //             child: ListTile(
            //               title: Text('${lessons.elementAt(index).lessonName}'),
            //               subtitle: Text(
            //                   'የአስተማሪ ስም : ${lessons.elementAt(index).teacher_name}'),
            //               trailing: Icon(
            //                 Icons.delete,
            //                 color: Color(0xFFB751623),
            //               ),
            //               onTap: () {
            //                 BlocProvider.of<LessonBloc>(context)
            //                     .add(LoadLessonContent(lessons.elementAt(index)));
            //                 Navigator.push(
            //                     context,
            //                     MaterialPageRoute(
            //                         builder: (context) =>
            //                             DetailPagelesson(index)));
            //               },
            //             ),
            //           ),
            //         );
            //       },
            //     );
            //   }
            //   return Container();
            // }),
          ],
        ),
      ),
    );
  }

  Widget buildPage(String text) => Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 28),
        ),
      );
}
