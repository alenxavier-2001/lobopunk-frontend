part of 'profileview_bloc.dart';

@freezed
class ProfileviewState with _$ProfileviewState {
  const factory ProfileviewState(
      {required bool isLoading,
      required bool hasError,
      required UserModel userDetails,
      required PostsPageModel userposts}) = _ProfileviewState;
  factory ProfileviewState.initial() => ProfileviewState(
      isLoading: false,
      hasError: false,
      userDetails: UserModel(),
      userposts: PostsPageModel());
}
