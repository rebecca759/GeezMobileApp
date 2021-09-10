import 'package:http/http.dart' as http;
import 'package:geezapp/Coursenew/models/models.dart';
import 'dart:convert';

class CourseDataProvider {
  static final String _baseUrl = "http://127.0.0.1:5000/api/v1/courses";

  Future<List<Course>> fetchCourses(int id) async {
    final response = await http.get(Uri.parse('$_baseUrl/$id'));

    if (response.statusCode == 200) {
      print(response.body);
      final courses = jsonDecode(response.body) as List;
      return courses.map((c) => Course.fromJson(c)).toList();
    } else {
      throw Exception("Couldn't fetch courses");
    }
  }
}
