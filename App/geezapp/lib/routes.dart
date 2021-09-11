import 'package:flutter/material.dart';
import 'package:geezapp/Exam/screens/quiz/quiz_screen.dart';
import 'package:geezapp/Lesson/screens/admin/AdminMain.dart';
import 'package:geezapp/Lesson/screens/admin/admin_login.dart';
import 'package:geezapp/Lesson/screens/admin/details.dart';
import 'package:geezapp/profile/signup/screens/signup.dart';
import 'package:geezapp/User/screens/welcome_screen.dart';
import 'package:geezapp/profile/profile_screen/screens/profile_screen.dart';
import 'package:geezapp/Lesson/screens/user/GrammarPage.dart';
import 'package:geezapp/Lesson/screens/user/UserHomePage.dart';
import 'package:geezapp/Lesson/screens/user/Courses2.dart';
import 'package:geezapp/Lesson/screens/user/home_screen.dart';
import 'package:geezapp/login/screens/login.dart';
import 'package:geezapp/User/screens/profile_edit.dart';
import 'package:geezapp/Lesson/screens/teacher/create_lessons.dart';
import 'package:geezapp/Lesson/screens/teacher/create_test.dart';
import 'package:geezapp/Lesson/screens/teacher/teacher_create.dart';
import 'package:geezapp/Lesson/screens/teacher/teacher_home.dart';

import 'Lesson/screens/admin/details_page_exam.dart';
import 'login/login_auth.dart';
import 'login/repository/login.dart';

class AppRoute {
  static const initialRoute = UserHomePage.routeName;
  static final routes = {
    WelcomeScreen.routeName: (BuildContext context) => WelcomeScreen(),
    LoginScreen.routeName: (BuildContext context) => LoginScreen(
          userRepository: UserRepository(),
        ),
    SignUpScreen.routeName: (BuildContext context) => SignUpScreen(),
    ProfileScreen.routeName: (BuildContext context) => ProfileScreen(),
    UserHomePage.routeName: (BuildContext context) => UserHomePage(),
    Courses2.routeName: (BuildContext context) => Courses2(),
    GrammarPage.routeName: (BuildContext context) => GrammarPage(),
    HomeScreen.routeName: (BuildContext context) => HomeScreen(),
    ProfileEdit.routeName: (BuildContext context) => ProfileEdit(),
    AdminLoginScreen.routeName: (BuildContext context) => AdminLoginScreen(),
    MainPage.routeName: (BuildContext context) => MainPage(
          title: 'አድሚን',
        ),
    LoginAuth.routeName: (BuildContext context) => LoginAuth(
          userRepository: UserRepository(),
        ),
    DetailPage.routeName: (BuildContext context) => DetailPage(),
    TeacherHome.routeName: (BuildContext context) => TeacherHome(),
    TeacherCreate.routeName: (BuildContext context) => TeacherCreate(),
    CreateLessonApp.routeName: (BuildContext context) => CreateLessonApp(),
    CreateTestApp.routeName: (BuildContext context) => CreateTestApp(),
    QuizScreen.routeName: (BuildContext context) => QuizScreen(),
    DetailPageQuestion.routeName: (BuildContext context) =>
        DetailPageQuestion(),
  };
}