import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geezapp/Exam/models/Questions.dart';
import 'package:geezapp/Questions/bloc/bloc.dart';
import 'package:geezapp/Questions/models/question_model.dart';

void main() => runApp(const CreateTestApp());

/// This is the main application widget.
class CreateTestApp extends StatefulWidget {
  static const String routeName = '/createtest';
  const CreateTestApp({Key? key}) : super(key: key);

  static const String _title = 'ፈተና አዘጋጅ';
  static const primaryColor = const Color(0xFFD55555);

  @override
  _CreateTestAppState createState() => _CreateTestAppState();
}

class _CreateTestAppState extends State<CreateTestApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
        title: const Text(CreateTestApp._title),
        backgroundColor: CreateTestApp.primaryColor,
      ),
      body: CreateTest(),
    );
  }
}

class CreateTest extends StatefulWidget {
  CreateTest({Key? key}) : super(key: key);

  @override
  _CreateTestState createState() => _CreateTestState();
}

class _CreateTestState extends State<CreateTest> {
  final _formkey = GlobalKey<FormState>();
  final Map<String, dynamic> _question = {};
  String levelIntial = '1';
  //bool _value = false;
  int initialvalue = -1;

  @override
  Widget build(BuildContext context) {
    // this._question["level_id"] = 1;
    // this._question["course_id"] = 1;
    // this._question["Question_id"] = this._question['question_id'];
    return BlocBuilder<QuestionBloc, QuestionState>(
        builder: (ctx, questionState) {
      if (questionState is QuestionOperationFailure) {
        return Center(child: Text("ፈተናውን መጫን ኣልተቻለም"));
      }
      if (questionState is QuetionOperationSuccess) {
        //   return Center(child: Text("በትክክል ተፈጥሯል"));
        // }

        return Form(
            key: _formkey,
            child: ListView(
              children: [
                Container(
                    padding: const EdgeInsets.all(4.0),
                    margin: const EdgeInsets.all(5.0),
                    child: Text(
                      'ደረጃ',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    )),
                Container(
                  padding: const EdgeInsets.all(4.0),
                  margin: const EdgeInsets.all(5.0),
                  width: 200,
                  child: DropdownButton<String>(
                    value: levelIntial,
                    icon: const Icon(Icons.arrow_downward),
                    iconSize: 14,
                    elevation: 16,
                    isExpanded: true,
                    dropdownColor: Colors.indigo[50],
                    style: const TextStyle(color: Colors.black),
                    onChanged: (String? newValue) {
                      setState(() {
                        levelIntial = newValue!;
                        this._question["level_id"] = int.parse(newValue);
                      });
                    },
                    items: <String>['1', '2', '3']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                Container(
                    padding: const EdgeInsets.all(4.0),
                    margin: const EdgeInsets.all(5.0),
                    child: Text(
                      'ጥያቄ',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    )),
                Container(
                  padding: const EdgeInsets.all(4.0),
                  margin: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.indigo[50],
                  ),
                  //height: 20,
                  child: TextFormField(
                      initialValue: "",
                      maxLines: 3,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: 'ጥያቄ'),
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return 'እባክዎ ጥያቄውን ያስገቡ';
                        }
                      },
                      onSaved: (qval) {
                        setState(() {
                          this._question["question"] = qval;
                          print(this._question["question"]);
                        });
                      }),
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Container(
                            padding: const EdgeInsets.all(4.0),
                            margin: const EdgeInsets.all(5.0),
                            child: Text(
                              'ምርጫ ፩',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            )),
                        Expanded(
                          // ምርጫ ፩ መልስ
                          child: Container(
                            padding: const EdgeInsets.all(4.0),
                            margin: const EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.indigo[50],
                            ),
                            //height: 20,
                            child: TextFormField(
                                maxLines: 3,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'ምርጫ ፩ መልስ'),
                                validator: (value) {
                                  if (value != null && value.isEmpty) {
                                    return 'እባክዎን ምርጫውን ያስገቡ';
                                  }
                                  return null;
                                },
                                onSaved: (ch1val) {
                                  setState(() {
                                    this._question["choice_1"] = ch1val;
                                  });
                                }),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                            padding: const EdgeInsets.all(4.0),
                            margin: const EdgeInsets.all(5.0),
                            child: Text(
                              'ምርጫ ፪',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            )),
                        Expanded(
                          child: Container(
                            //ምርጫ ፪ መልስ
                            padding: const EdgeInsets.all(4.0),
                            margin: const EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.indigo[50],
                            ),
                            //height: 20,
                            child: TextFormField(
                                maxLines: 3,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'ምርጫ ፪ መልስ'),
                                validator: (value) {
                                  if (value != null && value.isEmpty) {
                                    return 'እባክዎን ምርጫውን ያስገቡ';
                                  }
                                  return null;
                                },
                                onSaved: (ch2val) {
                                  setState(() {
                                    this._question["choice_2"] = ch2val;
                                  });
                                }),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                            padding: const EdgeInsets.all(4.0),
                            margin: const EdgeInsets.all(5.0),
                            child: Text(
                              'ምርጫ ፫',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            )),
                        Expanded(
                          child: Container(
                            //ምርጫ ፫ መልስ
                            padding: const EdgeInsets.all(4.0),
                            margin: const EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.indigo[50],
                            ),
                            //height: 20,
                            child: TextFormField(
                                maxLines: 3,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'ምርጫ ፫ መልስ'),
                                validator: (value) {
                                  if (value != null && value.isEmpty) {
                                    return 'እባክዎን ምርጫውን ያስገቡ';
                                  }
                                  return null;
                                },
                                onSaved: (ch3val) {
                                  setState(() {
                                    this._question["choice_3"] = ch3val;
                                  });
                                }),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                            padding: const EdgeInsets.all(4.0),
                            margin: const EdgeInsets.all(5.0),
                            child: Text(
                              'ምርጫ ፬',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            )),
                        Expanded(
                          child: Container(
                            //ምርጫ ፬ መልስ
                            padding: const EdgeInsets.all(4.0),
                            margin: const EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.indigo[50],
                            ),
                            //height: 20,
                            child: TextFormField(
                                maxLines: 3,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'ምርጫ ፬ መልስ'),
                                validator: (value) {
                                  if (value != null && value.isEmpty) {
                                    return 'እባክዎን ምርጫውን ያስገቡ';
                                  }
                                  return null;
                                },
                                onSaved: (ch4val) {
                                  setState(() {
                                    this._question["choice_4"] = ch4val;
                                  });
                                }),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                            padding: const EdgeInsets.all(4.0),
                            margin: const EdgeInsets.all(5.0),
                            child: Text(
                              'መልስ',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            )),
                        Expanded(
                          child: Container(
                            //ምርጫ ፬ መልስ
                            padding: const EdgeInsets.all(4.0),
                            margin: const EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.indigo[50],
                            ),
                            //height: 20,
                            child: TextFormField(
                                maxLines: 3,
                                decoration: InputDecoration(
                                    border: InputBorder.none, hintText: 'መልስ'),
                                validator: (value) {
                                  if (value != null && value.isEmpty) {
                                    return 'እባክዎን መልሱን ያስገቡ';
                                  }
                                  return null;
                                },
                                onSaved: (aval) {
                                  setState(() {
                                    this._question["Answer"] = aval;
                                  });
                                }),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.all(25),
                      height: 30,
                      child: ElevatedButton(
                        child: Text(
                          'አስገባ',
                          style: TextStyle(fontSize: 20.0),
                        ),
                        onPressed: () {
                          print(this._question);
                          final form = _formkey.currentState;
                          if (form != null && form.validate()) {
                            form.save();
                            print(this._question['question']);
                            print(this._question['choice_1']);
                            final QuestionEvents event =
                                CreateQuestion(Questions(
                              question: this._question["question"],
                              level_id: this._question['level_id'],
                              // tentative only for test purpose onlys
                              user_id: 1,
                              status: 'pending',
                              //Question_id: this._question.question,
                              choice_1: this._question['choice_1'],
                              choice_2: this._question['choice_2'],
                              choice_3: this._question['choice_3'],
                              choice_4: this._question['choice_4'],
                              answer: this._question['answer'],
                            ));
                            BlocProvider.of<QuestionBloc>(context).add(event);
                          }
                        },
                      ),
                    ),
                  ],
                )
              ],
            ));
      }
      return Container();
    });
  }
}
