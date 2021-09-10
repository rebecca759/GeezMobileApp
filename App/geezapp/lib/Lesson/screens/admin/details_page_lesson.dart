import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geezapp/Lesson/blocs/lesson_bloc.dart';
import 'package:geezapp/Lesson/blocs/lesson_event.dart';
import 'package:geezapp/Lesson/blocs/lesson_state.dart';
import 'package:geezapp/Lesson/models/lesson.dart';
import 'package:geezapp/Lesson/screens/admin/AdminMain.dart';

class DetailPagelesson extends StatefulWidget {
  final int index;

  DetailPagelesson(this.index);

  @override
  _StateDetailPagelesson createState() {
    return _StateDetailPagelesson();
  }
}

class _StateDetailPagelesson extends State<DetailPagelesson> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    Size size = MediaQuery.of(context).size;
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
            BlocProvider.of<LessonBloc>(context).add(LessonLoad('approved'));
            Navigator.pop(context);
          },
        ),
        title: Text(''),
      ),
      body: BlocBuilder<LessonBloc, LessonState>(
        builder: (_, state) {
          if (state is LessonOperationFailure) {
            return Text('Could not do lesson operation');
          }
          if (state is LessonOperationSuccess) {
            return Center(child: Text("Successfully updated course"));
          }
          if (state is LessonLoadSuccess) {
            String lessonContent = state.lesson.content;
            String lessonName = state.lesson.lessonName;
            return Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text("Lesson Name: ",style: TextStyle(fontSize: 20),),
                      TextFormField(
                        initialValue: lessonName,
                        onChanged: (val) {
                          textController.text = val;
                        },
                        decoration: InputDecoration(
                          hintStyle: TextStyle(fontSize: 30),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          fillColor: Color(0xFE0E0E0),
                          filled: true,
                        ),
                        onSaved: (value) {
                          setState(() {
                            lessonName = value!;
                          });
                        },
                      ),
                      Text("Content: ",style: TextStyle(fontSize: 20),),
                      SizedBox(height: 5,),
                      TextFormField(
                        initialValue: lessonContent,
                        onChanged: (val) {
                          textController.text = val;
                        },
                        decoration: InputDecoration(
                          hintStyle: TextStyle(fontSize: 30),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          fillColor: Color(0xFE0E0E0),
                          filled: true,
                        ),
                        maxLines: 20,
                        onSaved: (val) {
                          setState(() {
                            lessonContent = val!;
                          });
                        },
                      ),
                      Container(
                        margin: EdgeInsets.all(10.0),
                        width: size.width * 0.25,
                        child: RaisedButton(
                          onPressed: () {
                            final form = _formKey.currentState;
                            if (form != null && form.validate()) {
                              form.save();
                              print(lessonContent);
                              BlocProvider.of<LessonBloc>(context)
                                  .add(LessonUpdate(
                                Lesson(
                                    lesson_id: state.lesson.lesson_id,
                                    lessonName: lessonName,
                                    level_id: state.lesson.level_id,
                                    course_id: state.lesson.course_id,
                                    content: lessonContent,
                                    status: state.lesson.status,
                                    teacher_id: state.lesson.teacher_id),
                              ));
                            }
                          },
                          color: Color(0xFFCAB5BF),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Update',
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
                    ],
                  ),
                ),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
