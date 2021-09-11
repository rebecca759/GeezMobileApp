import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geezapp/profile/Profile_edit/repository/profile_edit.dart';
import './bloc.dart';
import 'package:geezapp/profile/Profile_edit/models/profile_edit.dart';

class ProfileEditBloc extends Bloc<ProfileEditEvent, ProfileEditState> {
  final ProfileEditRepository profileEditRepository;

  ProfileEditBloc({required this.profileEditRepository})
      : assert(profileEditRepository != null),
        super(ProfileEditLoading());

  @override
  Stream<ProfileEditState> mapEventToState(ProfileEditEvent event) async* {
    if (event is ProfileEditLoad) {
      yield ProfileEditLoading();
      try {
        final user = await profileEditRepository.getUser();
        print(user);
        yield ProfileEditLoadSuccess(user);
      } catch (_) {
        yield ProfileEditOperationFailure();
      }
    }

    if (event is ProfileEditUpdate) {
      print("come to update");
      try {
        await profileEditRepository.updateUser(event.profileEdit);
        final users = await profileEditRepository.getUser();
        yield ProfileEditLoadSuccess(users);
      } catch (e) {
        print(e);
        yield ProfileEditOperationFailure();
      }
    }
  }
}
