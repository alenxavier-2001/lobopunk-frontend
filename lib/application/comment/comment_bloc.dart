import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:lobopunk/core/contasts.dart';
import 'package:lobopunk/domain/comment/comment_model/comment_model.dart';
import 'package:lobopunk/domain/comment/comment_service.dart';
import 'package:lobopunk/domain/core/failures/main_failure.dart';

part 'comment_event.dart';
part 'comment_state.dart';
part 'comment_bloc.freezed.dart';

ValueNotifier<List<CommentModel>> commentListNotifier = ValueNotifier([]);

@injectable
class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final CommentServices _commentServices;

  CommentBloc(this._commentServices) : super(CommentState.initial()) {
    on<LoadComments>((event, emit) async {
      //send loading to UI
      emit(const CommentState(
          isLoading: true, hasError: false, commentsList: []));

      //get user data
      final result = await _commentServices.getComments(event.postid);

      //data to state

      final newState = result.fold((MainFailure failure) {
        return const CommentState(
            isLoading: false, hasError: true, commentsList: []);
      }, (List<CommentModel> resp) {
        return CommentState(
            isLoading: false, hasError: false, commentsList: resp);
      });
      // const LoadUserPosts();

      emit(newState);
    });

    //Add comment section

    on<AddComment>((event, emit) async {
      //send loading to UI
      emit(CommentState(
          isLoading: state.isLoading,
          hasError: state.hasError,
          commentsList: state.commentsList));

      //get user data
      final result = await _commentServices.postComment(event.data);

      //data to state

      final newState = result.fold((MainFailure failure) {
        return CommentState(
            isLoading: state.isLoading,
            hasError: state.hasError,
            commentsList: state.commentsList);
      }, (CommentModel resp) {
        return CommentState(
            isLoading: state.isLoading,
            hasError: state.hasError,
            commentsList: List.from(state.commentsList)..add(resp));
      });
      // const LoadUserPosts();

      emit(newState);
    });

    //Delete comment
    on<DeleteComment>((event, emit) async {
      emit(CommentState(
          isLoading: state.isLoading,
          hasError: state.hasError,
          commentsList: state.commentsList));

      // //delete comment
      final result = await _commentServices.deleteComment(event.commentid);

      //data to state

      final newState = result.fold((MainFailure failure) {
        return CommentState(
            isLoading: state.isLoading,
            hasError: state.hasError,
            commentsList: state.commentsList);
      }, (bool resp) {
        return CommentState(
            isLoading: state.isLoading,
            hasError: state.hasError,
            commentsList: List.from(state.commentsList)..removeAt(event.index));
      });
      // const LoadUserPosts();

      emit(newState);
    });

    //like comment
    on<LikeComment>((event, emit) async {
      emit(CommentState(
          isLoading: state.isLoading,
          hasError: state.hasError,
          commentsList: state.commentsList));

      // //get user data
      final result = await _commentServices.commentLike(event.commentid);

      //data to state

      final newState = result.fold((MainFailure failure) {
        return CommentState(
            isLoading: state.isLoading,
            hasError: state.hasError,
            commentsList: state.commentsList);
      }, (CommentModel resp) {
        return CommentState(
            isLoading: state.isLoading,
            hasError: state.hasError,
            commentsList: List.from(state.commentsList)
              ..replaceRange(event.index, event.index + 1, [resp]));
      });
      // const LoadUserPosts();

      emit(newState);
    });
    //dislike comment
    on<DislikeComment>((event, emit) async {
      emit(CommentState(
          isLoading: state.isLoading,
          hasError: state.hasError,
          commentsList: state.commentsList));

      final result = await _commentServices.commentDislike(event.commentid);

      //data to state

      final newState = result.fold((MainFailure failure) {
        return CommentState(
            isLoading: state.isLoading,
            hasError: state.hasError,
            commentsList: state.commentsList);
      }, (CommentModel resp) {
        return CommentState(
            isLoading: state.isLoading,
            hasError: state.hasError,
            commentsList: List.from(state.commentsList)
              ..replaceRange(event.index, event.index + 1, [resp]));
      });
      // const LoadUserPosts();

      emit(newState);
    });
    //subcomment Section

    //add subcomment

    on<AddSubComment>((event, emit) async {
      //send loading to UI
      emit(CommentState(
          isLoading: state.isLoading,
          hasError: state.hasError,
          commentsList: state.commentsList));

      //get user data
      final result = await _commentServices.postSubComment(event.data);

      //data to state

      final newState = result.fold((MainFailure failure) {
        return CommentState(
            isLoading: state.isLoading,
            hasError: state.hasError,
            commentsList: state.commentsList);
      }, (CommentModel resp) {
        return CommentState(
            isLoading: state.isLoading,
            hasError: state.hasError,
            commentsList: List.from(state.commentsList)
              ..replaceRange(event.index, event.index + 1, [resp]));
      });
      // const LoadUserPosts();

      emit(newState);
    });

//like subcomment
    on<LikeSubComment>((event, emit) async {
      emit(CommentState(
          isLoading: state.isLoading,
          hasError: state.hasError,
          commentsList: state.commentsList));

      // //get user data
      final result = await _commentServices.subCommentLike(
          event.commentid, event.subindex);

      //data to state

      final newState = result.fold((MainFailure failure) {
        log("errrrorr");
        return CommentState(
            isLoading: state.isLoading,
            hasError: state.hasError,
            commentsList: state.commentsList);
      }, (CommentModel resp) {
        return CommentState(
            isLoading: state.isLoading,
            hasError: state.hasError,
            commentsList: List.from(state.commentsList)
              ..replaceRange(event.index, event.index + 1, [resp]));
      });
      // const LoadUserPosts();

      emit(newState);
    });
    //dislike comment
    on<DislikeSubComment>((event, emit) async {
      emit(CommentState(
          isLoading: state.isLoading,
          hasError: state.hasError,
          commentsList: state.commentsList));

      final result = await _commentServices.subCommentDislike(
          event.commentid, event.subindex);

      //data to state

      final newState = result.fold((MainFailure failure) {
        return CommentState(
            isLoading: state.isLoading,
            hasError: state.hasError,
            commentsList: state.commentsList);
      }, (CommentModel resp) {
        return CommentState(
            isLoading: state.isLoading,
            hasError: state.hasError,
            commentsList: List.from(state.commentsList)
              ..replaceRange(event.index, event.index + 1, [resp]));
      });
      // const LoadUserPosts();

      emit(newState);
    });

    //delete subcomment

    on<DeleteSubComment>((event, emit) async {
      //send loading to UI
      emit(CommentState(
          isLoading: state.isLoading,
          hasError: state.hasError,
          commentsList: state.commentsList));

      //delete subcomment
      final result = await _commentServices.deleteSuubComment(
          event.commentid, event.subindex);

      //data to state

      final newState = result.fold((MainFailure failure) {
        return CommentState(
            isLoading: state.isLoading,
            hasError: state.hasError,
            commentsList: state.commentsList);
      }, (CommentModel resp) {
        return CommentState(
            isLoading: state.isLoading,
            hasError: state.hasError,
            commentsList: List.from(state.commentsList)
              ..replaceRange(event.index, event.index + 1, [resp]));
      });
      // const LoadUserPosts();

      emit(newState);
    });
  }
}
