import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geezapp/Lesson/blocs/blocs.dart';
import 'package:geezapp/Lesson/screens/user/home_screen.dart';
import 'package:geezapp/enums.dart';
import 'package:geezapp/profile/profile_screen/screens/profile_screen.dart';
import 'package:get/get.dart';

class GrammarPage extends StatefulWidget {
  static const String routeName = '/grammar';
  _GrammarPageState createState() => _GrammarPageState();
}

class _GrammarPageState extends State<GrammarPage> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              color: Color.fromRGBO(248, 248, 255, 1),
              border: Border.all(color: Color.fromRGBO(211, 211, 211, 1))),
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.only(left: 15, right: 15),
          child: ListView(
            children: [
              Container(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  decoration:
                      BoxDecoration(color: Color.fromRGBO(255, 204, 204, 0.5)),
                  child: Row(children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back)),
                    Text(
                      '      ንዑስ ትምህርት',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                  ])),
              Container(
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    children: [
                      Container(
                          padding: EdgeInsets.only(left: 45),
                          child: Text(
                            'ሰዋሰው',
                            style: TextStyle(fontSize: 25),
                          ))
                    ],
                  )),
              Container(
                  height: 520,
                  child:
                      BlocBuilder<LessonBloc, LessonState>(builder: (_, state) {
                    if (state is LessonOperationFailure) {
                      return Text('Could not do lesson operation');
                    }
                    if (state is LessonOperationSuccess) {
                      final lessons = state.lessons;
                      print(lessons);
                      return ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: lessons.length,
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
                                  height: 75,
                                  margin: EdgeInsets.only(top: 10, left: 5),
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(240, 248, 255, 1),
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Color.fromRGBO(
                                                  211, 211, 211, 1)))),
                                  child: Row(
                                    children: [
                                      Icon(Icons.play_arrow),
                                      GestureDetector(
                                        onTap: () {
                                          BlocProvider.of<LessonBloc>(context)
                                              .add(
                                            LoadLessonContent(
                                              lessons.elementAt(index),
                                            ),
                                          );
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
                    return CircularProgressIndicator();
                  }))
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomNavBar(
        utype: 'user',
        selectedMenu: MenuState.lessons,
      ),
    );
  }
}
