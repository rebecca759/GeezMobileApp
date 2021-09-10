import 'package:equatable/equatable.dart';
import 'package:geezapp/profile/Profile_edit/models/profile_edit.dart';


class ProfileEditState extends Equatable {
  const ProfileEditState();

  @override
  List<Object> get props => [];
}

class ProfileEditLoading extends ProfileEditState {}

class ProfileEditLoadSuccess extends ProfileEditState {
  final ProfileEdit profileEdit;

  ProfileEditLoadSuccess(this.profileEdit);

  @override
  List<Object> get props => [profileEdit];
}

class ProfileEditOperationFailure extends ProfileEditState {}
