import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geezapp/Comment/blocs/comment_event.dart';
import 'package:geezapp/Comment/blocs/comment_state.dart';
import 'package:geezapp/Comment/repository/comment-repository.dart';
import 'package:geezapp/Lesson/repository/lesson-repository.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final CommentRepository commentRepository;

  CommentBloc({required this.commentRepository}) : super(CommentLoading());
  @override
  Stream<CommentState> mapEventToState(CommentEvent event) async* {
    if (event is CommentLoad) {
      yield CommentLoading();
      try {
        final comments = await commentRepository.fetchComments(event.lesson_id);
        yield CommentOperationSuccess(comments);
      } catch (error) {
        print(error);
        yield CommentOperationFailure();
      }
    }

    if (event is CommentCreate) {
      yield CommentLoading();
      try {
        await commentRepository.create(event.comment);
        final comments =
            await commentRepository.fetchComments(event.comment.lesson_id);
        yield CommentOperationSuccess(comments);
      } catch (error) {
        print(error);
        yield CommentOperationFailure();
        await Future.delayed(Duration(seconds: 3));
        yield CommentLoading();
      }
    }
  }
}
