import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:lobopunk/domain/core/failures/main_failure.dart';
import 'package:lobopunk/domain/exporepage/explore_page_model/explore_page_model.dart';
import 'package:lobopunk/domain/hashtags/hashtags_services.dart';
import 'package:lobopunk/domain/hashtags/hastag_model/hastag_model.dart';
import 'package:lobopunk/domain/posts/posts_page_model/posts_page_model.dart';
import 'package:lobopunk/domain/publicpage/publicpage_services.dart';
import 'package:lobopunk/domain/user/user_model/user_model.dart';

part 'publicpage_event.dart';
part 'publicpage_state.dart';
part 'publicpage_bloc.freezed.dart';

@injectable
class PublicpageBloc extends Bloc<PublicpageEvent, PublicpageState> {
  PublicPageServices publicPageServices;
  HashtagsServices hashtagsServices;
  PublicpageBloc(this.publicPageServices, this.hashtagsServices)
      : super(PublicpageState.initial()) {
    on<LoadPublicPage>((event, emit) async {
      emit(PublicpageState(
          isLoading: false,
          hasError: false,
          searchList: [],
          publicposts: PostsPageModel(),
          hashtagList: [],
          explorepage: ExplorePageModel()));

      //get search List
      final result = await hashtagsServices.getHashtags();

      final newState = result.fold((MainFailure failure) {
        return PublicpageState(
            isLoading: false,
            hasError: true,
            searchList: [],
            publicposts: state.publicposts,
            hashtagList: [],
            explorepage: state.explorepage);
      }, (List<HashtagModel> resp) {
        HashtagModel mod =
            HashtagModel(id: "", hashtag: "Explore", count: 1, posts: [], v: 1);

        resp.insert(0, mod);
        return PublicpageState(
            isLoading: false,
            hasError: false,
            searchList: [],
            publicposts: state.publicposts,
            hashtagList: resp,
            explorepage: state.explorepage);
      });
      emit(newState);
    });
    on<LoadExploreSection>((event, emit) async {
      emit(PublicpageState(
          isLoading: state.isLoading,
          hasError: state.hasError,
          searchList: state.searchList,
          publicposts: state.publicposts,
          hashtagList: state.hashtagList,
          explorepage: state.explorepage));
      final result = await publicPageServices.getExplorePage();

      final newState = result.fold((MainFailure failure) {
        return PublicpageState(
            isLoading: false,
            hasError: true,
            searchList: [],
            publicposts: state.publicposts,
            hashtagList: state.hashtagList,
            explorepage: state.explorepage);
      }, (ExplorePageModel resp) {
        return PublicpageState(
            isLoading: false,
            hasError: false,
            searchList: [],
            publicposts: state.publicposts,
            hashtagList: state.hashtagList,
            explorepage: resp);
      });
      emit(newState);
    });
    on<SearchEvent>((event, emit) async {
      emit(PublicpageState(
          isLoading: true,
          hasError: false,
          searchList: state.searchList,
          publicposts: state.publicposts,
          explorepage: state.explorepage,
          hashtagList: []));

      //get search List
      final result = await publicPageServices.searchUsers(data: event.data);

      final newState = result.fold((MainFailure failure) {
        return PublicpageState(
            isLoading: false,
            hasError: true,
            searchList: [],
            publicposts: state.publicposts,
            explorepage: state.explorepage,
            hashtagList: []);
      }, (List<UserModel> resp) {
        return PublicpageState(
            isLoading: false,
            hasError: false,
            searchList: resp,
            explorepage: state.explorepage,
            publicposts: state.publicposts,
            hashtagList: []);
      });
      emit(newState);
    });
  }
}
