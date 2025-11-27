// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:nephroscan/core/firebase_client/auth_firebase_client.dart'
    as _i1059;
import 'package:nephroscan/core/firebase_client/firestore_client.dart' as _i961;
import 'package:nephroscan/core/injection/firebase_module.dart' as _i231;
import 'package:nephroscan/features/dashboard_screen/presentation/cubit/nav_bar_cubit/nav_bar_cubit.dart'
    as _i588;
import 'package:nephroscan/features/sign_in_sign_up_screen/cubit/user_sign_in_cubit/user_sign_in_cubit.dart'
    as _i291;
import 'package:nephroscan/features/sign_in_sign_up_screen/data/datasources/sign_up_remote_datasource.dart'
    as _i899;
import 'package:nephroscan/features/sign_in_sign_up_screen/data/repositories/sign_up_repository_impl.dart'
    as _i363;
import 'package:nephroscan/features/sign_in_sign_up_screen/domain/repositories/sign_up_repository.dart'
    as _i395;
import 'package:nephroscan/routes/auto_router.dart' as _i15;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final firebaseInjectableModule = _$FirebaseInjectableModule();
    gh.factory<_i588.NavBarCubit>(() => _i588.NavBarCubit());
    gh.lazySingleton<_i59.FirebaseAuth>(
      () => firebaseInjectableModule.firebaseAuth,
    );
    gh.lazySingleton<_i974.FirebaseFirestore>(
      () => firebaseInjectableModule.firebaseFirestore,
    );
    gh.lazySingleton<_i15.AppRouter>(() => _i15.AppRouter());
    gh.lazySingleton<_i961.FirestoreClient>(
      () => _i961.FirestoreClient(firestore: gh<_i974.FirebaseFirestore>()),
    );
    gh.lazySingleton<_i1059.AuthFirebaseClient>(
      () => _i1059.AuthFirebaseClient(
        auth: gh<_i59.FirebaseAuth>(),
        firestoreClient: gh<_i961.FirestoreClient>(),
      ),
    );
    gh.lazySingleton<_i899.SignUpRemoteDataSource>(
      () => _i899.SignUpRemoteDataSourceImpl(gh<_i1059.AuthFirebaseClient>()),
    );
    gh.lazySingleton<_i395.SignUpRepository>(
      () => _i363.SignUpRepositoryImpl(gh<_i899.SignUpRemoteDataSource>()),
    );
    gh.factory<_i291.UserSignInCubit>(
      () =>
          _i291.UserSignInCubit(signUpRepository: gh<_i395.SignUpRepository>()),
    );
    return this;
  }
}

class _$FirebaseInjectableModule extends _i231.FirebaseInjectableModule {}
