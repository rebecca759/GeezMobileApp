import 'package:meta/meta.dart';
import '../profile_edit.dart';

class ProfileEditRepository {
  final ProfileEditDataProvider dataProvider;

  ProfileEditRepository({required this.dataProvider})
      : assert(dataProvider != null);

  Future<ProfileEdit> getUser() async {
    return await dataProvider.getUser();
  }

  Future<void> updateUser(ProfileEdit user) async {
    await dataProvider.updateUser(user);
  }
}
