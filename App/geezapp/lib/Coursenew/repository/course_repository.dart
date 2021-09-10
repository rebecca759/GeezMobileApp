import 'package:geezapp/Coursenew/models/models.dart';
import 'package:geezapp/Coursenew/data_providers/course_data_provider.dart';

class CourseRepository {
  final CourseDataProvider dataProvider;
  CourseRepository(this.dataProvider);

  Future<Iterable<Course>> fetchcourse(int id) async {
    return this.dataProvider.fetchCourses(id);
  }
}
