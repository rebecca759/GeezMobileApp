import 'package:geezapp/Comment/models/models.dart';
import 'package:geezapp/Comment/data_providers/comment-data-provider.dart';

class CommentRepository {
  final CommentDataProvider dataProvider;
  CommentRepository(this.dataProvider);

  Future<List<Comment>> fetchComments(int lesson_id) async {
    return this.dataProvider.fetchComments(lesson_id);
  }

  Future<Comment> create(Comment comment) async {
    return this.dataProvider.create(comment);
  }
}
