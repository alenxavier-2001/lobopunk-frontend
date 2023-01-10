part of 'account_bloc.dart';

@freezed
class AccountState with _$AccountState {
  const factory AccountState(
      {required bool isLoading,
      required bool hasError,
      required UserModel userDetails,
      required List<PostModel> userposts,
      required List<PostModel> splitposts}) = _AccountState;

  factory AccountState.initial() => AccountState(
      isLoading: false,
      hasError: false,
      userDetails: UserModel(),
      userposts: [],
      splitposts: []);
}
