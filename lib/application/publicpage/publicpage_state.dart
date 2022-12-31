part of 'publicpage_bloc.dart';

@freezed
class PublicpageState with _$PublicpageState {
  const factory PublicpageState({
    required bool isLoading,
    required bool hasError,
    required List<UserModel> searchList,
    required List<HashtagModel> hashtagList,
    required PostsPageModel publicposts,
    required ExplorePageModel explorepage,
  }) = _PublicpageState;

  factory PublicpageState.initial() => PublicpageState(
      isLoading: false,
      hasError: false,
      searchList: [],
      publicposts: PostsPageModel(),
      hashtagList: [],
      explorepage: ExplorePageModel());
}
