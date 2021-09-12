import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geezapp/Auth/auth_bloc.dart';
import 'package:geezapp/Auth/auth_state.dart';
import 'package:geezapp/Lesson/screens/teacher/teacher_home.dart';
import 'package:geezapp/Lesson/screens/user/UserHomePage.dart';
import 'package:geezapp/login/repository/login.dart';
import 'package:flutter/material.dart';
import 'package:geezapp/login/style/theme.dart' as Style;
import 'package:geezapp/profile/welcome_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginAuth extends StatefulWidget {
  static const routeName = '/loginauth';
  final UserRepository userRepository;

  LoginAuth({Key? key, required this.userRepository}) : super(key: key);

  @override
  State<LoginAuth> createState() => _LoginAuthState();
}

String userType = "";

Future getId() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  userType = preferences.getString('userType')!;
}

class _LoginAuthState extends State<LoginAuth> {
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   locale: const Locale('mn', 'MN'),
    //   theme: ThemeData(
    //     fontFamily: 'Rubik',
    //     primarySwatch: Colors.blueGrey,
    //   ),
    //   home:
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
      if (state is AuthenticationAuthenticated) {
        print(userType);
        if (userType == 'teacher') {
          return TeacherHome();
        }
        return UserHomePage();
      }
      if (state is AuthenticationUnauthenticated) {
        return WelcomeScreen();
      }
      if (state is AuthenticationLoading) {
        return Scaffold(
          body: Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 25.0,
                  width: 25.0,
                  child: CircularProgressIndicator(
                    valueColor: new AlwaysStoppedAnimation<Color>(
                        Style.Colors.mainColor),
                    strokeWidth: 4.0,
                  ),
                )
              ],
            ),
          ),
        );
      }
      return Scaffold(
        body: Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 25.0,
                width: 25.0,
                child: CircularProgressIndicator(
                  valueColor:
                      new AlwaysStoppedAnimation<Color>(Style.Colors.mainColor),
                  strokeWidth: 4.0,
                ),
              )
            ],
          ),
        ),
      );
    });
    //   ),
    // );
  }
}
