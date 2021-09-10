import 'package:flutter/material.dart';
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
    return ListView(
      children: [
        Row(
          children: [
            Container(
              //width: 70.0,
              padding: const EdgeInsets.fromLTRB(15.0, 3.0, 15.0, 3.0),
              margin: const EdgeInsets.fromLTRB(10, 20, 40, 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.green[50],
              ),
              child: Text('ንዑስ ርዕሶች',
                  style: TextStyle(color: Colors.black, fontSize: 17)),
            ),
            // Expanded(
            //   child: Container(
            //       ////padding: const EdgeInsets.fromLTRB(15.0, 3.0, 15.0, 3.0),
            //       margin: const EdgeInsets.fromLTRB(10, 10, 0, 5),
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(20.0),
            //         //color: Colors.green[50],
            //       ),
            //       child: TextFormField(
            //         decoration: InputDecoration(
            //           hintText: "Search",
            //           //border: BorderStyle.solid,
            //         ),
            //       )),
            // ),
            // Container(
            //   margin: const EdgeInsetsDirectional.only(top: 10.0),
            //   child: const IconButton(
            //     onPressed: null,
            //     icon: Icon(Icons.search),
            //     tooltip: 'Search',
            //   ),
            // ),
          ],
        ),
        Container(
          height: 200.0,
          // decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(10.0),
          //     color: Colors.red[300]),
          //child: Text('hello'),
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

              // s
            ],
          ),
        ),

        ///////////////

        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
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
            // Expanded(
            //   child: Container(
            //       ////padding: const EdgeInsets.fromLTRB(15.0, 3.0, 15.0, 3.0),
            //       margin: const EdgeInsets.fromLTRB(10, 10, 0, 5),
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(20.0),
            //         //color: Colors.green[50],
            //       ),
            //       child: TextFormField(
            //         decoration: InputDecoration(
            //           hintText: "Search",
            //           //border: BorderStyle.solid,
            //         ),
            //       )),
            // ),
            // Container(
            //   margin: const EdgeInsetsDirectional.only(top: 10.0),
            //   child: const IconButton(
            //     onPressed: null,
            //     icon: Icon(Icons.search),
            //     tooltip: 'Search',
            //   ),
            // ),
          ],
        ),
        Container(
          height: 200.0,
          // decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(10.0),
          //     color: Colors.red[300]),
          //child: Text('hello'),
          child: ListView(
            padding: const EdgeInsets.all(10.0),
            scrollDirection: Axis.horizontal,
            children: [
              Container(
                width: 130.0,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.pink[800]),
                child: Stack(
                  overflow: Overflow.visible,
                  children: [
                    Positioned(
                      top: 20,
                      left: 10,
                      child: Stack(children: [
                        Text('Question',
                            style: TextStyle(color: Colors.grey[100])),
                      ]),
                    ),
                    Positioned(
                      bottom: 20,
                      right: 20,
                      child: Text('level 2',
                          style: TextStyle(color: Colors.grey[50])),
                    )
                  ],
                ),
              ),

              ///////////

              Container(
                width: 130.0,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.pink[800]),
                child: Stack(
                  overflow: Overflow.visible,
                  children: [
                    Positioned(
                      top: 20,
                      left: 10,
                      child: Stack(children: [
                        Text('Question',
                            style: TextStyle(color: Colors.grey[100])),
                      ]),
                    ),
                    Positioned(
                      bottom: 20,
                      right: 20,
                      child: Text('level 2',
                          style: TextStyle(color: Colors.grey[50])),
                    )
                  ],
                ),
              ),

              Container(
                width: 130.0,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.pink[800]),
                child: Stack(
                  overflow: Overflow.visible,
                  children: [
                    Positioned(
                      top: 20,
                      left: 10,
                      child: Stack(children: [
                        Text('Question',
                            style: TextStyle(color: Colors.grey[100])),
                      ]),
                    ),
                    Positioned(
                      bottom: 20,
                      right: 20,
                      child: Text('level 2',
                          style: TextStyle(color: Colors.grey[50])),
                    )
                  ],
                ),
              ),
              ///////////
              ///
              Container(
                width: 130.0,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.pink[800]),
                child: Stack(
                  overflow: Overflow.visible,
                  children: [
                    Positioned(
                      top: 20,
                      left: 10,
                      child: Stack(children: [
                        Text('Question',
                            style: TextStyle(color: Colors.grey[100])),
                      ]),
                    ),
                    Positioned(
                      bottom: 20,
                      right: 20,
                      child: Text('level 2',
                          style: TextStyle(color: Colors.grey[50])),
                    )
                  ],
                ),
              ),

              ///////////
            ],
          ),
        ),
      ],
    );
  }
}
