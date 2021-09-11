// @dart=2.9
import 'imports.dart';

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