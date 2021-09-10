import 'package:http/http.dart' as http;
import 'package:geezapp/Comment/models/models.dart';
import 'dart:convert';

class CommentDataProvider {
  static final String _baseUrl = "http://127.0.0.1:5000/api/v1/comment";

  Future<List<Comment>> fetchComments(int lesson_id) async {
    final response = await http.get(Uri.parse('$_baseUrl/lesson/$lesson_id'));

    if (response.statusCode == 200) {
      final comments = jsonDecode(response.body) as List;
      return comments.map((c) => Comment.fromJson(c)).toList();
    } else {
      throw Exception("አስተያየት ማግኘት አልተቻለም");
    }
  }

  Future<Comment> create(Comment comment) async {
    print(comment.comment); //check this
    final http.Response response =
        // comment'],
        //     lesson_id: json['lesson_id'],
        //     user_id: json['user_id'],
        //     status: json['status'

        await http.post(Uri.parse('$_baseUrl'),
            headers: <String, String>{"Content-Type": "application/json"},
            body: jsonEncode({
              'comment': comment.comment,
              'lesson_id': comment.lesson_id,
              'user_id': comment.user_id,
              'status': comment.status
            }));

    if (response.statusCode == 201) {
      return Comment.fromJson(jsonDecode(response.body));
    }
    {
      throw Exception("failed to create comment");
    }
  }
}
