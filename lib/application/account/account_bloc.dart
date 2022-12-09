import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:lobopunk/domain/core/failures/main_failure.dart';
import 'package:lobopunk/domain/posts/post_model/post_model.dart';
import 'package:lobopunk/domain/posts/posts_page_model/posts_page_model.dart';
import 'package:lobopunk/domain/user/user_model/user_model.dart';
import 'package:lobopunk/domain/user/user_services.dart';

part 'account_event.dart';
part 'account_state.dart';
part 'account_bloc.freezed.dart';

ValueNotifier<List<PostModel>> accountPostListNotifier = ValueNotifier([]);

@injectable
class AccountBloc extends Bloc<AccountEvent, AccountState> {
  final UserServices _userService;
  AccountBloc(this._userService) : super(AccountState.initial()) {
    on<LoadUserData>((event, emit) async {
      //send loading to UI
      emit(AccountState(
          isLoading: true,
          hasError: false,
          userDetails: UserModel(),
          userposts: PostsPageModel()));

      //get user data
      final result = await _userService.getUseData();

      //data to state

      final newState = result.fold((MainFailure failure) {
        return AccountState(
            isLoading: false,
            hasError: true,
            userDetails: UserModel(),
            userposts: PostsPageModel());
      }, (UserModel resp) {
        return AccountState(
            isLoading: false,
            hasError: false,
            userDetails: resp,
            userposts: PostsPageModel());
      });
      // const LoadUserPosts();

      emit(newState);
    });

//get user posts
    on<LoadUserPosts>((event, emit) async {
      //send loading to UI
      emit(AccountState(
          isLoading: state.isLoading,
          hasError: state.hasError,
          userDetails: state.userDetails,
          userposts: PostsPageModel()));

      //get user data
      final result = await _userService.getMyPosts();

      //data to state

      final newState = result.fold((MainFailure failure) {
        return AccountState(
            isLoading: false,
            hasError: true,
            userDetails: state.userDetails,
            userposts: PostsPageModel());
      }, (PostsPageModel resp) {
        accountPostListNotifier.value = resp.results!;
        return AccountState(
            isLoading: state.isLoading,
            hasError: state.isLoading,
            userDetails: state.userDetails,
            userposts: resp);
      });
      emit(newState);
    });

    on<ChangeProfileImage>((event, emit) async {
      //send loading to UI
      emit(AccountState(
          isLoading: true,
          hasError: false,
          userDetails: UserModel(),
          userposts: state.userposts));

      // //get user data

      final result = await _userService.uploadProfilePic(file: event.file);

      // //data to state

      final newState = result.fold((MainFailure failure) {
        log("Failure");
        return AccountState(
            isLoading: false,
            hasError: true,
            userDetails: UserModel(),
            userposts: PostsPageModel());
      }, (UserModel resp) {
        return AccountState(
            isLoading: false,
            hasError: false,
            userDetails: resp,
            userposts: state.userposts);
      });
      emit(newState);
    });

    //update user info

    on<EditProfile>((event, emit) async {
      //send loading to UI
      emit(AccountState(
          isLoading: true,
          hasError: false,
          userDetails: UserModel(),
          userposts: PostsPageModel()));

      // //get user data

      final result = await _userService.editProfile(data: event.data);

      // //data to state

      final newState = result.fold((MainFailure failure) {
        log("Failure");
        return AccountState(
            isLoading: false,
            hasError: true,
            userDetails: UserModel(),
            userposts: PostsPageModel());
      }, (UserModel resp) {
        return AccountState(
            isLoading: false,
            hasError: false,
            userDetails: resp,
            userposts: PostsPageModel());
      });
      emit(newState);
    });
    on<EditSocialLink>((event, emit) async {
      //send loading to UI
      emit(AccountState(
          isLoading: true,
          hasError: false,
          userDetails: UserModel(),
          userposts: state.userposts));

      // //get user data

      final result = await _userService.editSocialLink(data: event.data);

      // //data to state

      final newState = result.fold((MainFailure failure) {
        log("Failure");
        return AccountState(
            isLoading: false,
            hasError: true,
            userDetails: UserModel(),
            userposts: state.userposts);
      }, (UserModel resp) {
        return AccountState(
            isLoading: false,
            hasError: false,
            userDetails: resp,
            userposts: state.userposts);
      });
      emit(newState);
    });

//       emit(AccountState(
//           isLoading: true, hasError: false, userDetails: UserModel()));
// //update profile image function

//       final result = await _userService.uploadProfilePic(file: event.file);

//       //update to ui
//       final newState = result.fold((MainFailure failure) {
//         return AccountState(
//             isLoading: false, hasError: true, userDetails: UserModel());
//       }, (UserModel data) {
//         // String path = data['path'];
//         // state.userDetails.profileimage = path;
//         AccountState(isLoading: false, hasError: false, userDetails: data);
//       });
//       emit(newState!);
//     });
  }
}
