import 'package:equatable/equatable.dart';
import 'package:geezapp/Coursenew/models/models.dart';

abstract class CourseState extends Equatable {
  const CourseState();

  @override
  List<Object> get props => [];
}


class CourseLoading extends CourseState {}

class CourseOperationSuccess extends CourseState {
  final Iterable<Course> courses;

  CourseOperationSuccess([this.courses = const []]);

  @override
  List<Object> get props => [courses];
}

class CourseOperationFailure extends CourseState {}