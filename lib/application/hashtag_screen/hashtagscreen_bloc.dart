import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:lobopunk/domain/core/failures/main_failure.dart';
import 'package:lobopunk/domain/posts/post_services.dart';
import 'package:lobopunk/domain/posts/posts_page_model/posts_page_model.dart';

part 'hashtagscreen_event.dart';
part 'hashtagscreen_state.dart';
part 'hashtagscreen_bloc.freezed.dart';

@injectable
class HashtagscreenBloc extends Bloc<HashtagscreenEvent, HashtagscreenState> {
  final PostService postService;
  HashtagscreenBloc(this.postService) : super(HashtagscreenState.initial()) {
    on<LoadHashtagPosts>((event, emit) async {
      emit(HashtagscreenState(
          isLoading: true, hasError: false, posts: PostsPageModel()));

      final result = await postService.getPostbyhashtag(event.hashtag);

      //data to state

      final newState = result.fold((MainFailure failure) {
        return HashtagscreenState(
            isLoading: false, hasError: true, posts: PostsPageModel());
      }, (PostsPageModel resp) {
        return HashtagscreenState(
          isLoading: false,
          hasError: false,
          posts: resp,
        );
      });
      // const LoadUserPosts();

      emit(newState);
    });
  }
}
