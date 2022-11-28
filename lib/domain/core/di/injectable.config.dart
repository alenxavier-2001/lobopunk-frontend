// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../application/account/account_bloc.dart' as _i9;
import '../../../infrastructure/account/account_impl.dart' as _i4;
import '../../../infrastructure/addpost/addpost_impl.dart' as _i6;
import '../../../infrastructure/auth/auth_impl.dart' as _i8;
import '../../account/account_services.dart' as _i3;
import '../../addpost/addpost_services.dart' as _i5;
import '../../auth/auth_services.dart'
    as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
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
  gh.lazySingleton<_i3.AccountService>(() => _i4.AccountImplementation());

  gh.lazySingleton<_i7.AuthService>(() => _i8.AuthImplementation());
  gh.factory<_i9.AccountBloc>(() => _i9.AccountBloc(get<_i3.AccountService>()));
  return get;
}
