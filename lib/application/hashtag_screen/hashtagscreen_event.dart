part of 'hashtagscreen_bloc.dart';

@freezed
class HashtagscreenEvent with _$HashtagscreenEvent {
  const factory HashtagscreenEvent.loadHashtagPosts(String hashtag) =
      LoadHashtagPosts;
}
