import 'package:equatable/equatable.dart';
import 'package:geezapp/Comment/models/models.dart';

abstract class CommentState extends Equatable {
  const CommentState();

  @override
  List<Object> get props => [];
}

class CommentLoading extends CommentState {}

class CommentOperationSuccess extends CommentState {
  final Iterable<Comment> comments;

  CommentOperationSuccess([this.comments = const []]);

  @override
  List<Object> get props => [comments];
}

class CommentOperationFailure extends CommentState {}


