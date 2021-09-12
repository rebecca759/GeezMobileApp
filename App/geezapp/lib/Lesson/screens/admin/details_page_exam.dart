import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geezapp/Questions/bloc/bloc.dart';
import 'package:geezapp/Questions/models/question_model.dart';

class DetailPageQuestion extends StatefulWidget {
  static const String routeName = '/details_exam';
  final int index = 1;

  DetailPageQuestion(index);

  @override
  _StateDetailPageQuestion createState() {
    return _StateDetailPageQuestion();
  }
}

class _StateDetailPageQuestion extends State<DetailPageQuestion> {
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
            BlocProvider.of<QuestionBloc>(context).add(LoadOldQuestions());
            Navigator.pop(context);
          },
        ),
        title: Text(''),
      ),
      body: BlocBuilder<QuestionBloc, QuestionState>(
        builder: (_, state) {
          print("STATE");
          print(state);
          if (state is QuestionOperationFailure) {
            return Text('Could not do lesson operation');
          }
          if (state is QuestionLoadSuccess) {
            //   return Center(child: Text("Successfully updated course"));
            // }
            // if (state is QuestionLoadSuccess) {
            String questionContent = state.question.question;
            String questionChoice1 = state.question.choice_1;
            String questionChoice2 = state.question.choice_2;
            String questionChoice3 = state.question.choice_3;
            String questionChoice4 = state.question.choice_4;
            String questionAnswer = state.question.answer;

            print("Choice");
            print(questionChoice1);
            print(questionChoice2);
            print(questionChoice3);
            print(questionChoice4);

            return Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        "Question: ",
                        style: TextStyle(fontSize: 20),
                      ),
                      TextFormField(
                        initialValue: questionContent,
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
                            questionContent = value!;
                          });
                        },
                      ),
                      Text(
                        "Choice 1: ",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        initialValue: questionChoice1,
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
                        onSaved: (val) {
                          setState(() {
                            questionChoice1 = val!;
                          });
                        },
                      ),
                      Text(
                        "Choice 2: ",
                        style: TextStyle(fontSize: 20),
                      ),
                      TextFormField(
                        initialValue: questionChoice2,
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
                            questionChoice2 = value!;
                          });
                        },
                      ),
                      Text(
                        "Choice 3: ",
                        style: TextStyle(fontSize: 20),
                      ),
                      TextFormField(
                        initialValue: questionChoice3,
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
                            questionChoice3 = value!;
                          });
                        },
                      ),
                      Text(
                        "Choice 4: ",
                        style: TextStyle(fontSize: 20),
                      ),
                      TextFormField(
                        initialValue: questionChoice4,
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
                            questionChoice4 = value!;
                          });
                        },
                      ),
                      Text(
                        "Answer: ",
                        style: TextStyle(fontSize: 20),
                      ),
                      TextFormField(
                        initialValue: questionAnswer,
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
                            questionAnswer = value!;
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
                              //print(lessonContent);
                              BlocProvider.of<QuestionBloc>(context)
                                  .add(UpdateQuestion(
                                Questions(
                                  question_id: state.question.question_id,
                                  question: questionContent,
                                  level_id: state.question.level_id,
                                  user_id: state.question.user_id,
                                  status: state.question.status,
                                  Question_id: state.question.question_id,
                                  choice_1: questionChoice1,
                                  choice_2: questionChoice2,
                                  choice_3: questionChoice3,
                                  choice_4: questionChoice4,
                                  answer: questionAnswer,
                                ),
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


// class DetailPageExam extends StatelessWidget{
//   static const String routeName = '/details_exam';
//   final int index = 1;

//   DetailPageExam();


//   @override
//   Widget build(BuildContext context){
//     return Scaffold(
//         appBar: AppBar(
//           flexibleSpace: Container(
//             decoration: BoxDecoration(

//               color: Color(0xFFCAB5BF),
//             ),
//           ),
//           leading: IconButton(
//             icon:Icon(Icons.arrow_back) ,
//             onPressed: (){
//               Navigator.pop(context);
//             },
//           ),
//           title: Text(''),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child:SingleChildScrollView(
//             child: Column(
//               children: [
//                 TextField(
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(30.0),

//                     ),
//                     hintText: "Content",
//                     hintStyle: TextStyle(fontSize: 30),
//                     fillColor:  Color(0xFFE0E0E0),
//                     filled: true,


//                   ),
//                   maxLines: 20,
//                 ),
//                 Container(
//                   margin: EdgeInsets.all(15.0),
//                   width: 50.0,
//                   child: RaisedButton(
//                     onPressed: () {},
//                     color: Color(0xFFCAB5BF),


//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: <Widget>[
//                         Text(
//                           'Edit',
//                           style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.w700,
//                             color: Colors.white,
//                           ),
//                         ),

//                       ],
//                     ),
//                   ),
//                 ),
//               ],

//             ),
//           ),
//         )

//     );
//   }

// }