// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geezapp/Comment/blocs/comment_bloc.dart';
import 'package:geezapp/Comment/repository/comment-repository.dart';
import 'package:geezapp/Coursenew/data_providers/course_data_provider.dart';
import 'package:geezapp/Coursenew/repository/course_repository.dart';
import 'package:geezapp/Lesson/data_providers/lesson-data-provider.dart';
import 'package:geezapp/Lesson/repository/lesson-repository.dart';
import 'package:geezapp/profile/Profile_edit/bloc/profile_edit_bloc.dart';
import 'package:geezapp/profile/Profile_edit/data_provider/profile_edit.dart';
import 'package:geezapp/profile/Profile_edit/repository/profile_edit.dart';
import 'package:geezapp/profile/signup/bloc/signup_bloc.dart';
import 'package:geezapp/profile/signup/repository/signup.dart';
import 'package:geezapp/profile/signup/screens/signup.dart';
import 'package:geezapp/Lesson/screens/user/home_screen.dart';
import 'package:geezapp/login/repository/login.dart';
import 'package:geezapp/profile/profile_screen/bloc/profile_screen_bloc.dart';
import 'package:geezapp/profile/profile_screen/data_provider/profile_screen.dart';
import 'package:geezapp/profile/profile_screen/repository/profile_screen.dart';
import 'package:geezapp/profile/signup/signup.dart';
import 'Auth/auth_bloc.dart';
import 'Auth/auth_event.dart';
import 'Auth/auth_state.dart';
import 'Comment/data_providers/comment-data-provider.dart';
import 'Coursenew/blocs/course_bloc.dart';
import 'Lesson/blocs/lesson_bloc.dart';
import 'Questions/Repository/question_repository.dart';
import 'Questions/bloc/question_bloc.dart';
import 'Questions/bloc/question_events.dart';
import 'Questions/data_providers/question_data_provider.dart';
import 'login/screens/login.dart';
import 'package:geezapp/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Lesson/screens/user/UserHomePage.dart';

class SimpleBlocDelegate extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    print(error);
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var email = preferences.getString('email');
  Bloc.observer = SimpleBlocDelegate();

  final userRepository = UserRepository();
  //1
  final commentRepository = CommentRepository(CommentDataProvider());
final profileEditRepository =
      ProfileEditRepository(dataProvider: ProfileEditDataProvider());
  final signupRepository = SignupRepository(dataProvider: SignupDataProvider());
  final lessonRepository = LessonRepository(LessonDataProvider());
  final courseRepository = CourseRepository(CourseDataProvider());
  final profileScreenRepository =
      ProfileScreenRepository(dataProvider: ProfileScreenDataProvider());
  final questRepository = QuestionRepository(QuestionDataProvider());
  runApp(
    MultiBlocProvider(
      providers: [
        //2
        BlocProvider(
          create: (ctx) => CommentBloc(commentRepository: commentRepository),
        ),
        BlocProvider(
          create: (ctx) => LessonBloc(lessonRepository: lessonRepository),
        ),
        BlocProvider(
          create: (ctx) => CourseBloc(courseRepository: courseRepository),
        ),
        BlocProvider<AuthenticationBloc>(
          create: (context) {
            return AuthenticationBloc(userRepository: userRepository)
              ..add(AppStarted());
          },
        ),
        BlocProvider(
            create: (ctx) => ProfileScreenBloc(
                profileScreenRepository: profileScreenRepository)),
        BlocProvider(
            create: (ctx) => SignupBloc(signupRepository: signupRepository)),

        BlocProvider(
            create: (ctx) => QuestionBloc(questionRepository: questRepository)
              ..add(LoadQuestionsById(1))),
              BlocProvider(
            create: (ctx) =>
                ProfileEditBloc(profileEditRepository: profileEditRepository)),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: AppRoute.routes,
        initialRoute: AppRoute.initialRoute,
      ),
    ),
  );
}