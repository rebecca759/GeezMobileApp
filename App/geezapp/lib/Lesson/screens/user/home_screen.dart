import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geezapp/Comment/blocs/blocs.dart';
import 'package:geezapp/Comment/models/comment.dart';
import 'package:geezapp/Lesson/blocs/blocs.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/homescreen';
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //e1
  final _formKey = GlobalKey<FormState>();

  final Map<String, dynamic> _comment = {};
  String prevVal = "";
  String currentval = "wer";

  void changedata() {
    setState(() {
      this.prevVal = currentval;
      this.currentval = "polikmujnhybgfvcdduynhbtgv";
    });
  }

  void changedata1() {
    setState(() {
      this.currentval = this.prevVal;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<LessonBloc, LessonState>(
          builder: (_, state) {
            if (state is LessonOperationFailure) {
              return Text('Could not do course operation');
            }
            if (state is LessonLoadSuccess) {
              final String content = state.lesson.content;
              return ListView(
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Column(children: [
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 60),
                                child: IconButton(
                                    onPressed: () {
                                      BlocProvider.of<LessonBloc>(context).add(
                                          LessonListLoad(
                                              course_id:
                                                  state.lesson.course_id));
                                      Navigator.pop(context);
                                    },
                                    icon: Icon(Icons.arrow_back)),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                        'assets/images/left_top.png',
                                      ),
                                      fit: BoxFit.fill),
                                ),
                              )
                            ],
                          )
                        ]),
                        Container(
                          height: 150,
                          width: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage('assets/images/right_top.png'),
                                fit: BoxFit.fill),
                          ),
                        ),
                      ]),
                  Container(
                    height: 500,
                    margin: EdgeInsets.all(30),
                    padding: EdgeInsets.all(20),
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Text(
                        "$content",
                        style: TextStyle(fontSize: 23, height: 1.2),
                      ),
                    ),
                  ),
                  // Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //     children: <Widget>[
                  //       Container(
                  //           child: ElevatedButton(
                  //         onPressed: changedata1,
                  //         child: Text('ተመለስ'),
                  //         style: ElevatedButton.styleFrom(
                  //             shape: RoundedRectangleBorder(
                  //               borderRadius: BorderRadius.circular(40),
                  //             ),
                  //             primary: Colors.orange),
                  //       )),
                  //       Container(
                  //         child: ElevatedButton(
                  //           onPressed: changedata,
                  //           child: Text('ቀጣይ'),
                  //           style: ElevatedButton.styleFrom(
                  //               shape: RoundedRectangleBorder(
                  //                 borderRadius: BorderRadius.circular(40),
                  //               ),
                  //               primary: Colors.orange),
                  //         ),
                  //       ),
                  //     ]),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                            margin: EdgeInsets.only(top: 10),
                            width: 300,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey)),
                            child: TextFormField(
                              onSaved: (val) {
                                this._comment["comment"] = val;
                              },
                              maxLines: 4,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: '   አስተያየት'),
                            )),
                        Container(
                            margin: EdgeInsets.only(top: 5, left: 250),
                            child: ElevatedButton(
                              onPressed: () {
                                final form = _formKey.currentState;
                                if (form != null && form.validate()) {
                                  form.save();
                                  final CommentEvent event = CommentCreate(
                                      Comment(
                                          lesson_id: state.lesson.lesson_id!,
                                          comment: this._comment["comment"],
                                          status: "pending",
                                          user_id: 1));
                                  BlocProvider.of<CommentBloc>(context)
                                      .add(event);
                                }
                              },
                              child: Text('ላክ'),
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  primary: Color(0xFFe39b9b)),
                            )),
                      ],
                    ),
                  ),

//4
                  BlocBuilder<CommentBloc, CommentState>(builder: (_, state) {
                    if (state is CommentOperationSuccess) {
                      return Column(
                        children: [
                          Container(child: Text("አስተያየቶች")),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color.fromRGBO(0, 0, 0, 0.5)),
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: [
                                ...state.comments.map(
                                  (c) => Container(
                                    padding: EdgeInsets.only(top: 5, bottom: 5),
                                    margin: EdgeInsets.only(bottom: 3),
                                    width: 300,
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromRGBO(220, 220, 220, 0.5),
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey))),
                                    child: Text('   ${c.comment}'),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      );
                    }
                    if (state is CommentOperationFailure) {
                      return Text("couldn't load comments");
                    }

                    return Container();
                  }),
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
