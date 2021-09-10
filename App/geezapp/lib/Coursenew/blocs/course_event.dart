import 'package:equatable/equatable.dart';
import 'package:geezapp/Coursenew/models/course.dart';

abstract class CourseEvent extends Equatable {
  const CourseEvent();
}

class CourseListLoad extends CourseEvent {
  final int level_id;
  const CourseListLoad({required this.level_id});

  @override
  List<Object?> get props => [level_id];
}