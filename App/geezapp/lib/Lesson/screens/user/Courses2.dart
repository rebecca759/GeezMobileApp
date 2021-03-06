import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geezapp/Exam/screens/quiz/quiz_screen.dart';
import 'package:geezapp/Lesson/blocs/blocs.dart';
import 'package:geezapp/Lesson/blocs/lesson_state.dart';
import 'package:geezapp/Lesson/screens/user/GrammarPage.dart';
import 'package:geezapp/enums.dart';
import 'package:geezapp/profile/profile_screen/screens/profile_screen.dart';

class Courses2 extends StatefulWidget {
  static const String routeName = '/courses';
  _Courses2State createState() => _Courses2State();
}

class _Courses2State extends State<Courses2> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: BlocConsumer<LessonBloc, LessonState>(
              listener: (ctx, lessonState) {},
              builder: (ctx, lessonState) {
                return ListView(
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 15, left: 22),
                      child: Text('ትምህርቶች',
                          style: TextStyle(
                              fontSize: 35, fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      height: 400,
                      padding: EdgeInsets.only(top: 20, bottom: 20, left: 20),
                      margin: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(232, 231, 229, 0.5), //gray
                          border: Border.all(
                              color: Color.fromRGBO(232, 231, 229, 0.5)),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(children: [
                        Row(children: [
                          Text(
                            'ደረጃ አንድ   ',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                wordSpacing: 1.5),
                          ),
                          Icon(Icons.arrow_downward_outlined),
                        ]),
                        Row(children: [
                          GestureDetector(
                            onTap: () {
                              final lessonBloc =
                                  BlocProvider.of<LessonBloc>(context);

                              lessonBloc.add(LessonListLoad(course_id: 1));

                              Navigator.pushNamed(
                                  context, GrammarPage.routeName);
                            },
                            child: Container(
                                height: 300,
                                margin: EdgeInsets.only(top: 10),
                                padding: EdgeInsets.only(
                                    top: 100, right: 15, left: 15, bottom: 15),
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(246, 105, 85, 1),
                                    borderRadius:
                                        BorderRadius.circular(10)), //red
                                child: Column(children: [
                                  Row(
                                    children: [
                                      Icon(Icons.book, color: Colors.white)
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text('ሰዋሰው',
                                          style: TextStyle(color: Colors.white))
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text('100 ቃላት ክጅርህብግ',
                                          style: TextStyle(color: Colors.white))
                                    ],
                                  ),
                                ])),
                          ),
                          Column(children: [
                            GestureDetector(
                              onTap: () {
                                final lessonBloc =
                                    BlocProvider.of<LessonBloc>(context);

                                lessonBloc.add(LessonListLoad(course_id: 2));

                                Navigator.pushNamed(
                                    context, GrammarPage.routeName);
                              },
                              child: Container(
                                  height: 140,
                                  padding: EdgeInsets.only(
                                      top: 40, left: 10, right: 10),
                                  margin: EdgeInsets.only(left: 20, top: 10),
                                  decoration: BoxDecoration(
                                      color: Colors.yellow,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.note_add,
                                            color: Colors.white,
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'ትምህርቶች',
                                            style:
                                                TextStyle(color: Colors.white),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text('100 ቃላት ክጅርህብግ',
                                              style: TextStyle(
                                                  color: Colors.white))
                                        ],
                                      ),
                                    ],
                                  )),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, QuizScreen.routeName);
                              },
                              child: Container(
                                  height: 140,
                                  padding: EdgeInsets.only(
                                      top: 40, left: 10, right: 10),
                                  margin: EdgeInsets.only(left: 20, top: 15),
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(115, 202, 194, 1),
                                      borderRadius:
                                          BorderRadius.circular(10)), //green
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Icon(Icons.note_add,
                                              color: Colors.white)
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text('ፈተና',
                                              style: TextStyle(
                                                  color: Colors.white))
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text('100 ቃላት ክጅርህብግ',
                                              style: TextStyle(
                                                  color: Colors.white))
                                        ],
                                      ),
                                    ],
                                  )),
                            )
                          ])
                        ])
                      ]),
                    ),
                    Container(
                      height: 400,
                      padding: EdgeInsets.only(top: 20, bottom: 20, left: 20),
                      margin: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(232, 231, 229, 0.5), //gray
                          border: Border.all(
                              color: Color.fromRGBO(232, 231, 229, 0.5)),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(children: [
                        Row(children: [
                          Text(
                            'ደረጃ  ሁለት  ',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                wordSpacing: 1.5),
                          ),
                          Icon(Icons.arrow_downward_outlined),
                        ]),
                        Row(children: [
                          GestureDetector(
                            onTap: () {
                              final lessonBloc =
                                  BlocProvider.of<LessonBloc>(context);

                              lessonBloc.add(LessonListLoad(course_id: 3));

                              Navigator.pushNamed(
                                  context, GrammarPage.routeName);
                            },
                            child: Container(
                                height: 300,
                                margin: EdgeInsets.only(top: 10),
                                padding: EdgeInsets.only(
                                    top: 100, right: 15, left: 15, bottom: 15),
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(117, 34, 188, 1),
                                    borderRadius:
                                        BorderRadius.circular(10)), //red
                                child: Column(children: [
                                  Row(
                                    children: [
                                      Icon(Icons.book, color: Colors.white)
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text('ሰዋሰው',
                                          style: TextStyle(color: Colors.white))
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text('100 ቃላት ክጅርህብግ',
                                          style: TextStyle(color: Colors.white))
                                    ],
                                  ),
                                ])),
                          ),
                          Column(children: [
                            GestureDetector(
                              onTap: () {
                                final lessonBloc =
                                    BlocProvider.of<LessonBloc>(context);

                                lessonBloc.add(LessonListLoad(course_id: 4));

                                Navigator.pushNamed(
                                    context, GrammarPage.routeName);
                              },
                              child: Container(
                                  height: 140,
                                  padding: EdgeInsets.only(
                                      top: 40, left: 10, right: 10),
                                  margin: EdgeInsets.only(left: 20, top: 10),
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(207, 128, 51, 1),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.note_add,
                                            color: Colors.white,
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'ትምህርቶች',
                                            style:
                                                TextStyle(color: Colors.white),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text('100 ቃላት ክጅርህብግ',
                                              style: TextStyle(
                                                  color: Colors.white))
                                        ],
                                      ),
                                    ],
                                  )),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, QuizScreen.routeName);
                              },
                              child: Container(
                                  height: 140,
                                  padding: EdgeInsets.only(
                                      top: 40, left: 10, right: 10),
                                  margin: EdgeInsets.only(left: 20, top: 15),
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(201, 182, 114, 1),
                                      borderRadius:
                                          BorderRadius.circular(10)), //green
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Icon(Icons.note_add,
                                              color: Colors.white)
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text('ፈተና',
                                              style: TextStyle(
                                                  color: Colors.white))
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text('100 ቃላት ክጅርህብግ',
                                              style: TextStyle(
                                                  color: Colors.white))
                                        ],
                                      ),
                                    ],
                                  )),
                            )
                          ])
                        ])
                      ]),
                    )
                  ],
                );
              })),
      bottomNavigationBar: CustomNavBar(
        utype: 'user',
        selectedMenu: MenuState.lessons,
      ),
    );
  }
}
