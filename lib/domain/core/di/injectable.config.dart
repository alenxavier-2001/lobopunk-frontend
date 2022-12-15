// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:lobopunk/application/account/account_bloc.dart' as _i17;
import 'package:lobopunk/application/comment/comment_bloc.dart' as _i18;
import 'package:lobopunk/domain/addpost/addpost_services.dart' as _i3;
import 'package:lobopunk/domain/auth/auth_services.dart' as _i5;
import 'package:lobopunk/domain/comment/comment_service.dart' as _i7;
import 'package:lobopunk/domain/common_services/common_services.dart' as _i9;
import 'package:lobopunk/domain/filepicker_service/file_picker_services.dart'
    as _i11;
import 'package:lobopunk/domain/posts/post_services.dart' as _i13;
import 'package:lobopunk/domain/user/user_services.dart' as _i15;
import 'package:lobopunk/infrastructure/addpost/addpost_impl.dart' as _i4;
import 'package:lobopunk/infrastructure/auth/auth_impl.dart' as _i6;
import 'package:lobopunk/infrastructure/comments/comments_impl.dart' as _i8;
import 'package:lobopunk/infrastructure/common_impl/common_impl.dart' as _i10;
import 'package:lobopunk/infrastructure/file_picker_impl/file_picker_impl.dart'
    as _i12;
import 'package:lobopunk/infrastructure/post/post_impl.dart' as _i14;
import 'package:lobopunk/infrastructure/userdetails/user_impl.dart' as _i16;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.AddPostService>(() => _i4.AddPostImplementation());
  gh.lazySingleton<_i5.AuthService>(() => _i6.AuthImplementation());
  gh.lazySingleton<_i7.CommentServices>(() => _i8.Commentimplementation());
  gh.lazySingleton<_i9.CommonService>(() => _i10.CommonImplementation());
  gh.lazySingleton<_i11.FilePickerServices>(
      () => _i12.FilePickerImplementation());
  gh.lazySingleton<_i13.PostService>(() => _i14.PostImplementation());
  gh.lazySingleton<_i15.UserServices>(() => _i16.UserImplementation());
  gh.factory<_i17.AccountBloc>(() => _i17.AccountBloc(gh<_i15.UserServices>()));
  gh.factory<_i18.CommentBloc>(
      () => _i18.CommentBloc(gh<_i7.CommentServices>()));
  return get;
}
