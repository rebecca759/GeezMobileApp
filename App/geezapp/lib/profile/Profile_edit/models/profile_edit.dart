import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class ProfileEdit extends Equatable {
  ProfileEdit(
      {required this.email,
      required this.firstName,
      required this.secondName,
      required this.password,
      });

  final String email;
  final String firstName;
  final String secondName;
  final String password;

  @override
  List<Object> get props => [email, firstName, secondName, password,];

  factory ProfileEdit.fromJson(Map<String, dynamic> json) {
    return ProfileEdit(
        email: json['email'] ?? "",
        password: json['password'] ?? "",
        firstName: json['firstName'] ?? "",
        secondName: json['secondName'] ?? "",
);
    
  }

  @override
  String toString() => 'ProfileEdit { email: $email, password: $password, firstName: $firstName, secondName: $secondName, }';
}
