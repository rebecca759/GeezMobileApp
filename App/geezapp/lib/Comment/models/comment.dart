// 'comment_id': fields.Integer,
//     'comment': fields.String,
//     'lesson_id': fields.Integer,
//     'user_id': fields.Integer,
//     'status'
class Comment {
  final int? comment_id;
  final String comment;
  final int lesson_id;
  final int user_id;
  final String? status;
  
  Comment(
      {this.comment_id,
      required this.comment,
      required this.lesson_id,
      required this.user_id,
      required this.status,
     });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
        comment_id: json['comment_id'],
        comment: json['comment'],
        lesson_id: json['lesson_id'],
        user_id: json['user_id'],
        status: json['status'],
        );
  }
}