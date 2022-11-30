part of 'account_bloc.dart';

@freezed
class AccountEvent with _$AccountEvent {
  const factory AccountEvent.loadUserData() = LoadUserData;
  const factory AccountEvent.changeProfileImage({
    required File file,
  }) = ChangeProfileImage;
}
