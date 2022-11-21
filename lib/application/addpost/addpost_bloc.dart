import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:lobopunk/domain/addpost/addpost_services.dart';
import 'package:lobopunk/domain/core/failures/main_failure.dart';

part 'addpost_event.dart';
part 'addpost_state.dart';
part 'addpost_bloc.freezed.dart';

class AddpostBloc extends Bloc<AddpostEvent, AddpostState> {
  final AddPostService _addPostService;
  AddpostBloc(this._addPostService) : super(AddpostState.initial()) {
    on<GetFile>((event, emit) async {
      emit(AddpostState(
          isLoading: true, hasError: true, videofile: File(''), hashtags: []));

      //get file from gallery
      final result = await _addPostService.addPostVideo();

      //data to state
      final newState = result.fold((MainFailure failure) {
        return AddpostState(
            isLoading: false,
            hasError: true,
            videofile: File(""),
            hashtags: []);
      }, (File res) {
        return AddpostState(
            isLoading: false, hasError: true, videofile: res, hashtags: []);
      });
      emit(newState);
    });
  }
}
