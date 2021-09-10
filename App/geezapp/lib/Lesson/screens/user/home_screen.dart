import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geezapp/Lesson/blocs/blocs.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/homescreen';
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
    return Scaffold(body: SafeArea(
        child: BlocBuilder<LessonBloc, LessonState>(builder: (_, state) {
      if (state is LessonOperationFailure) {
        return Text('Could not do course operation');
      }
      if (state is LessonLoadSuccess) {
        final String content = state.lesson.content;
        return ListView(
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
                                        course_id: state.lesson.course_id));
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
                          image: AssetImage('assets/images/right_top.png'),
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
          ],
        );
      }
      return Container();
    })));
  }
}
