import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geezapp/Lesson/blocs/lesson_bloc.dart';
import 'package:geezapp/Lesson/blocs/lesson_event.dart';
import 'package:geezapp/Lesson/blocs/lesson_state.dart';
import 'package:geezapp/Lesson/models/lesson.dart';

class DetailPage extends StatefulWidget {
  static const String routeName = '/details';

  DetailPage();

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: Color(0xFFCAB5BF),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            BlocProvider.of<LessonBloc>(context).add(LessonLoad('pending'));
            Navigator.pop(context);
          },
        ),
        title: Text(''),
      ),
      body: BlocBuilder<LessonBloc, LessonState>(
        builder: (_, state) {
          if (state is LessonOperationFailure) {
            return Text('Could not do course operation');
          }
          if (state is LessonLoadSuccess) {
            final String lessonContent = state.lesson.content;
            return Center(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TextFormField(
                          initialValue: lessonContent,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            hintText: "$lessonContent",
                            hintStyle: TextStyle(fontSize: 30),
                            fillColor: Color(0xFFE0E0E0),
                            filled: true,
                          ),
                          maxLines: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Container(
                                //margin: EdgeInsets.symmetric(horizontal: 100.0),
                                child: RaisedButton(
                                  onPressed: () {
                                    BlocProvider.of<LessonBloc>(context)
                                        .add(LessonUpdate(Lesson(
                                      lesson_id: state.lesson.lesson_id,
                                      content: state.lesson.content,
                                      course_id: state.lesson.course_id,
                                      lessonName: state.lesson.lessonName,
                                      level_id: state.lesson.level_id,
                                      teacher_id: state.lesson.teacher_id,
                                      status: 'approved',
                                    )));
                                    BlocProvider.of<LessonBloc>(context)
                                        .add(LessonLoad("pending"));
                                    Navigator.pop(context);
                                  },
                                  color: Colors.green,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        'ተቀበል',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.3,
                              ),
                              RaisedButton(
                                onPressed: () {
                                  final form = _formKey.currentState;
                                  if (form != null && form.validate()) {
                                    form.save();
                                    BlocProvider.of<LessonBloc>(context).add(
                                        LessonDelete(state.lesson.lesson_id!));
                                    BlocProvider.of<LessonBloc>(context)
                                        .add(LessonLoad("pending"));
                                    Navigator.pop(context);
                                  }
                                },
                                color: Colors.red,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      'አትቀበል',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
          print("here");
          return Container();
        },
      ),
    );
  }

  void moveToLastScreen() {
    //Navigator.pop(context);
  }
}
