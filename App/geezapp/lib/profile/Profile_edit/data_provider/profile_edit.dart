import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/profile_edit.dart';
import 'package:http/http.dart' as http;

class ProfileEditDataProvider {
  final _baseUrl = 'http://localhost:5000/api/v1';

  ProfileEditDataProvider();

  Future<ProfileEdit> getUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String id = preferences.getString('user_id')!;
    final response = await http.get('$_baseUrl/user/profile/$id');
    print(response.body);
    if (response.statusCode == 200) {
      print('response 200');
      final user = ProfileEdit.fromJson(jsonDecode(response.body)[0]);
      print(user);
      return user;
    } else {
      print("user not found ");

      throw Exception('Failed to load profile');
    }
  }

  Future<void> updateUser(ProfileEdit profileEdit) async {
    print('updating');
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String id = preferences.getString('user_id')!;

    final http.Response response = await http.patch(
      '$_baseUrl/user/profile/$id',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'email': profileEdit.email,
        'password': profileEdit.password,
        'firstName': profileEdit.firstName,
        'secondName': profileEdit.secondName,
      }),
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to update profile.');
    }
  }
}
