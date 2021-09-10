import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geezapp/Coursenew/blocs/course_bloc.dart';
import 'package:geezapp/Coursenew/blocs/course_event.dart';
import 'package:geezapp/Coursenew/blocs/course_state.dart';
import 'package:geezapp/Coursenew/models/course.dart';
import 'package:geezapp/Lesson/blocs/blocs.dart';
import 'package:geezapp/Lesson/my_flutter_app_icons.dart';
import 'package:geezapp/profile/profile_screen/screens/profile_screen.dart';
import 'package:geezapp/Lesson/screens/user/GrammarPage.dart';
import 'package:geezapp/Lesson/screens/user/home_screen.dart';
import 'package:geezapp/enums.dart';

class UserHomePage extends StatefulWidget {
  static const String routeName = '/userhome';
  _UserHomePageState createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  void initState() {
    final lessonBloc = BlocProvider.of<LessonBloc>(context);

    lessonBloc.add(LessonListLoad(course_id: 1));

    final courseBloc = BlocProvider.of<CourseBloc>(context);

    courseBloc.add(CourseListLoad(level_id: 2));
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.only(left: 90),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text('ሰላም አሌክስ  ',
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    wordSpacing: 1.5)),
                            Icon(MyFlutterApp.waving_hand_black_24dp)
                          ],
                        )
                      ],
                    )),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(239, 222, 212, 1), //light brown
                      border:
                          Border.all(color: Color.fromRGBO(232, 231, 229, 0.5)),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              'ደረጃ አንድ',
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(
                                width: 50,
                                height: 50,
                                child: CircularProgressIndicator(
                                  backgroundColor: Colors.green,
                                )),
                            Text('12/50 ትምህርቶች', style: TextStyle(fontSize: 20))
                          ],
                        )
                      ]),
                ),
                Row(children: [
                  Text('ተያያዥ ትምህርቶች ',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          wordSpacing: 1.5))
                ]),
                Container(
                  margin: EdgeInsets.only(bottom: 10, top: 10),
                  decoration: BoxDecoration(
                    border: Border(
                        top:
                            BorderSide(color: Color.fromRGBO(211, 211, 211, 1)),
                        bottom: BorderSide(
                            color: Color.fromRGBO(211, 211, 211, 1))),
                  ),
                  height: 150,
                  child:
                      BlocBuilder<CourseBloc, CourseState>(builder: (_, state) {
                    print('state: $state');
                    if (state is CourseOperationFailure) {
                      return Text('Could not do course operation');
                    }
                    if (state is CourseOperationSuccess) {
                      print('success');
                      final courses = state.courses;
                      return ListView.builder(
                          itemCount: courses.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (_, index) {
                            return GestureDetector(
                              onTap: () {
                                BlocProvider.of<LessonBloc>(context).add(LessonListLoad(course_id: courses.elementAt(index).course_id!));
                                Navigator.pushNamed(
                                    context, GrammarPage.routeName);
                              },
                              child: Container(
                                  margin: EdgeInsets.all(15),
                                  width: 125,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color.fromRGBO(205, 173, 130, 1)),
                                  child: Align(
                                    child: Text(
                                      '${courses.elementAt(index).courseName}',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )),
                            );
                          });
                    }
                    return Container();
                  }),
                ),
                Row(children: [
                  Text('ትምህርቶች ',
                      style: TextStyle(
                          fontSize: 25,
                          wordSpacing: 1.5,
                          fontWeight: FontWeight.bold))
                ]),
                Container(
                  height: size.height * 0.26,
                  child:
                      BlocBuilder<LessonBloc, LessonState>(builder: (_, state) {
                    if (state is LessonOperationFailure) {
                      return Text('Could not do lesson operation');
                    }
                    if (state is LessonOperationSuccess) {
                      final lessons = state.lessons;
                      return ListView.builder(
                          itemCount: lessons.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (_, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, HomeScreen.routeName);
                                BlocProvider.of<LessonBloc>(context).add(
                                  LoadLessonContent(
                                    lessons.elementAt(index),
                                  ),
                                );
                              },
                              child: Container(
                                  height: 55,
                                  margin: EdgeInsets.only(top: 10, left: 5),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Color.fromRGBO(
                                                  211, 211, 211, 1)))),
                                  child: Row(
                                    children: [
                                      Icon(Icons.play_arrow),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, HomeScreen.routeName);
                                        },
                                        child: Container(
                                          child: Align(
                                            child: Text(
                                              lessons
                                                  .elementAt(index)
                                                  .lessonName,
                                              style: TextStyle(fontSize: 25),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                            );
                          });
                    }
                    return Container();
                  }),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar:
          CustomNavBar(selectedMenu: MenuState.home, utype: 'user'),
    );
  }
}
