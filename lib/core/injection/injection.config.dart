// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:nephroscan/features/dashboard_screen/cubits/nav_bar_cubit/nav_bar_cubit.dart'
    as _i588;
import 'package:nephroscan/routes/auto_router.dart' as _i15;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i588.NavBarCubit>(() => _i588.NavBarCubit());
    gh.lazySingleton<_i15.AppRouter>(() => _i15.AppRouter());
    return this;
  }
}
