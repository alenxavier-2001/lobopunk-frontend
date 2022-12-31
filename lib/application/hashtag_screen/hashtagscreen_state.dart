part of 'hashtagscreen_bloc.dart';

@freezed
class HashtagscreenState with _$HashtagscreenState {
  const factory HashtagscreenState(
      {required bool isLoading,
      required bool hasError,
      required PostsPageModel posts}) = _HashtagscreenState;
  factory HashtagscreenState.initial() => HashtagscreenState(
      isLoading: false, hasError: false, posts: PostsPageModel());
}
