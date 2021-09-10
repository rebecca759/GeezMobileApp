import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geezapp/Coursenew/blocs/blocs.dart';
import 'package:geezapp/Coursenew/repository/course_repository.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  final CourseRepository courseRepository;

  CourseBloc({required this.courseRepository}) : super(CourseLoading());

  @override
  Stream<CourseState> mapEventToState(CourseEvent event) async* {
    if (event is CourseListLoad) {
      yield CourseLoading();
      try {
        final courses = await courseRepository.fetchcourse(event.level_id);
        yield CourseOperationSuccess(courses);
        
      } catch (error) {
        print(error);
        yield CourseOperationFailure();
      }
    }
  }
}
