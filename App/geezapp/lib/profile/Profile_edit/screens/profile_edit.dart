import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geezapp/profile/Profile_edit/bloc/profile_edit_bloc.dart';
import 'package:geezapp/profile/Profile_edit/bloc/profile_edit_event.dart';
import 'package:geezapp/profile/Profile_edit/profile_edit.dart';
import 'package:geezapp/profile/form_val.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ProfileEditW extends StatefulWidget {
  const ProfileEditW({Key? key}) : super(key: key);
  static const String routeName = '/edit';
  @override
  _StateProfileEdit createState() => _StateProfileEdit();
}

class _StateProfileEdit extends State<ProfileEditW> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _profile = {};
  String id = "";

  Future getEmail() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      id = preferences.getString('user_id')!;
    });
  }

  @override
  void initState() {
    super.initState();
    getEmail();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: Text('Profile Edit Page'),
            backgroundColor: Color(0xFFB77415A)),
        body: BlocBuilder<ProfileEditBloc, ProfileEditState>(
          builder: (_, state) {
            if (state is ProfileEditLoadSuccess) {
              String email = state.profileEdit.email;
              String firstName = state.profileEdit.firstName;
              String secondName = state.profileEdit.secondName;
              String password = state.profileEdit.password;
              return SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 100,
                        ),
                        TextFormField(
                          onSaved: (valf) {
                            setState(() {
                              firstName = valf!;
                            });
                          },
                          initialValue: state.profileEdit.firstName,
                          decoration: InputDecoration(
                            hintText: 'first name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          validator: (v) {
                            if (v!.isValidName) {
                              return null;
                            } else {
                              return 'Please enter a valid name';
                            }
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          onSaved: (vals) {
                            setState(() {
                              secondName = vals!;
                            });
                          },
                          initialValue: state.profileEdit.secondName,
                          decoration: InputDecoration(
                              hintText: 'second name',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          validator: (v) {
                            if (v!.isValidName) {
                              return null;
                            } else {
                              return 'Please enter a valid name';
                            }
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          onSaved: (vale) {
                            setState(() {
                              email = vale!;
                            });
                          },
                          initialValue: state.profileEdit.email,
                          decoration: InputDecoration(
                              hintText: 'email',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          validator: (v) {
                            if (v!.isValidEmail) {
                              return null;
                            } else {
                              return 'Please enter a valid email';
                            }
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          onSaved: (valp) {
                            setState(() {
                              password = valp!;
                            });
                          },
                          initialValue: state.profileEdit.password,
                          decoration: InputDecoration(
                              hintText: 'password',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          validator: (v) {
                            if (v!.isValidPassword) {
                              return null;
                            } else {
                              return 'Password must contain an uppercase, lowercase, numeric digit and special character';
                            }
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            final form = _formKey.currentState;
                            if (form != null && form.validate()) {
                              form.save();
                              BlocProvider.of<ProfileEditBloc>(context).add(
                                ProfileEditUpdate(
                                  ProfileEdit(
                                    email: email,
                                    password: password,
                                    firstName: firstName,
                                    secondName: secondName,
                                  ),
                                ),
                              );
                            }
                            ;
                          },
                          child: Text('Update'),
                          style: ElevatedButton.styleFrom(
                              primary: Color(0xFFB77415A),
                              fixedSize: Size(350, 50),
                              textStyle: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50))),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
            if (state is ProfileEditOperationFailure) {
              return Text('unable to load');
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
