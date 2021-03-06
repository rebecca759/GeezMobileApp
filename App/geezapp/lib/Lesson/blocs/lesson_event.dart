import 'package:equatable/equatable.dart';
import 'package:geezapp/Lesson/models/lesson.dart';

abstract class LessonEvent extends Equatable {
  const LessonEvent();
}

class LessonLoad extends LessonEvent {
  final String status;
  const LessonLoad(this.status);

  @override
  List<Object?> get props => [this.status];
}
class LessonCreate extends LessonEvent {
  final Lesson lesson;

  const LessonCreate(this.lesson);
   
   @override
  List<Object> get props => [lesson];

  @override
  String toString() => 'lesson Created {lesson: $lesson}';
}
  
class LoadLessonContent extends LessonEvent {
  final Lesson lesson;
  LoadLessonContent(this.lesson);

  @override
  List<Object?> get props => [this.lesson];
}

class LessonUpdate extends LessonEvent {
  final Lesson lesson;

  const LessonUpdate(this.lesson);

  @override
  List<Object> get props => [lesson];

  @override
  String toString() => 'Lesson Updated {lesson: $lesson}';
}

class LessonListLoad extends LessonEvent {
  final int course_id;
  const LessonListLoad({required this.course_id});

  @override
  List<Object?> get props => [course_id];
}

class LessonDelete extends LessonEvent {
  final int id;

  const LessonDelete(this.id);

  @override
  List<Object> get props => [id];

  @override
  toString() => 'Lesson Deleted {lesson Id: $id}';
}