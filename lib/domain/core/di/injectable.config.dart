// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:lobopunk/application/account/account_bloc.dart' as _i9;
import 'package:lobopunk/domain/auth/auth_services.dart' as _i3;
import 'package:lobopunk/domain/filepicker_service/file_picker_services.dart'
    as _i5;
import 'package:lobopunk/domain/user/user_services.dart' as _i7;
import 'package:lobopunk/infrastructure/auth/auth_impl.dart' as _i4;
import 'package:lobopunk/infrastructure/file_picker_impl/file_picker_impl.dart'
    as _i6;
import 'package:lobopunk/infrastructure/userdetails/user_impl.dart' as _i8;

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
  gh.lazySingleton<_i3.AuthService>(() => _i4.AuthImplementation());
  gh.lazySingleton<_i5.FilePickerServices>(
      () => _i6.FilePickerImplementation());
  gh.lazySingleton<_i7.UserServices>(() => _i8.UserImplementation());
  gh.factory<_i9.AccountBloc>(() => _i9.AccountBloc(gh<_i7.UserServices>()));
  return get;
}
