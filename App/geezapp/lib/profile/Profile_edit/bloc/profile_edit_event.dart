import 'package:equatable/equatable.dart';
import 'package:geezapp/profile/Profile_edit/models/profile_edit.dart';


abstract class ProfileEditEvent extends Equatable {
  const ProfileEditEvent();
}

class ProfileEditLoad extends ProfileEditEvent {
  const ProfileEditLoad();

  @override
  List<Object> get props => [];
}

class ProfileEditUpdate extends ProfileEditEvent {
  final ProfileEdit profileEdit;

  const ProfileEditUpdate(this.profileEdit);

  @override
  List<Object> get props => [profileEdit];

  @override
  String toString() => 'Profile Updated {profile: $profileEdit}';
}