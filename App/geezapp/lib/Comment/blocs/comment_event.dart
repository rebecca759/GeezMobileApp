import 'package:equatable/equatable.dart';
import 'package:geezapp/Comment/models/comment.dart';

abstract class CommentEvent extends Equatable {
  const CommentEvent();
}

class CommentLoad extends CommentEvent {
  final int lesson_id;
  const CommentLoad(this.lesson_id);

  @override
  List<Object?> get props => [this.lesson_id];
}

class CommentCreate extends CommentEvent {
  final Comment comment;

  const CommentCreate(this.comment);

  @override
  List<Object> get props => [comment];

  String toString() => 'comment added {comment:$comment}';
}

//comment content?? maybe?
