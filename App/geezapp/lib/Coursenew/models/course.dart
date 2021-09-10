class Course {
  final int? course_id;
  final String courseName;
  final int level_id;

  Course(
      {this.course_id,
      required this.courseName,
      required this.level_id,
      });
  

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
        course_id: json['course_id'],
        courseName: json['courseName'],
        level_id: json['level_id'],
        );
  }
}
