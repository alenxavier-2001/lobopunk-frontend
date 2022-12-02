part of 'account_bloc.dart';

@freezed
class AccountEvent with _$AccountEvent {
  const factory AccountEvent.loadUserData() = LoadUserData;
  const factory AccountEvent.changeProfileImage({
    required File file,
  }) = ChangeProfileImage;
  const factory AccountEvent.editProfile({
    required Map<String, dynamic> data,
  }) = EditProfile;
  const factory AccountEvent.editSocialLink({
    required Map<String, dynamic> data,
  }) = EditSocialLink;
}
