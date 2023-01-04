import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:lobopunk/domain/core/failures/main_failure.dart';
import 'package:lobopunk/domain/posts/posts_page_model/posts_page_model.dart';
import 'package:lobopunk/domain/user/user_model/user_model.dart';
import 'package:lobopunk/domain/user/user_services.dart';

part 'profileview_event.dart';
part 'profileview_state.dart';
part 'profileview_bloc.freezed.dart';

@injectable
class ProfileviewBloc extends Bloc<ProfileviewEvent, ProfileviewState> {
  final UserServices _userService;
  ProfileviewBloc(this._userService) : super(ProfileviewState.initial()) {
    on<LoadData>((event, emit) async {
      emit(ProfileviewState(
          isLoading: true,
          hasError: false,
          userDetails: UserModel(),
          userposts: PostsPageModel()));

      //get user data
      final result = await _userService.getUserDatabyid(event.userid);

      //data to state

      final newState = result.fold((MainFailure failure) {
        return ProfileviewState(
            isLoading: false,
            hasError: true,
            userDetails: UserModel(),
            userposts: PostsPageModel());
      }, (UserModel resp) {
        log(resp.username.toString());
        return ProfileviewState(
            isLoading: false,
            hasError: false,
            userDetails: resp,
            userposts: PostsPageModel());
      });
      // const LoadUserPosts();

      emit(newState);

      final result2 = await _userService.getMyPostsbyId(event.userid);

      //data to state

      final newState2 = result2.fold((MainFailure failure) {
        return ProfileviewState(
            isLoading: false,
            hasError: true,
            userDetails: state.userDetails,
            userposts: state.userposts);
      }, (PostsPageModel resp) {
        return ProfileviewState(
            isLoading: false,
            hasError: false,
            userDetails: state.userDetails,
            userposts: resp);
      });
      // const LoadUserPosts();

      emit(newState2);
    });
  }
}
