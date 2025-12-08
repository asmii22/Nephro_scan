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
import 'package:firebase_storage/firebase_storage.dart' as _i457;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:nephroscan/core/firebase_client/auth_firebase_client.dart'
    as _i1059;
import 'package:nephroscan/core/firebase_client/authorized_firebase_client.dart'
    as _i700;
import 'package:nephroscan/core/injection/firebase_module.dart' as _i231;
import 'package:nephroscan/features/ct_scan_screen/data/datasources/ct_scan_data_source.dart'
    as _i718;
import 'package:nephroscan/features/ct_scan_screen/data/repositories/ct_scan_repository_impl.dart'
    as _i100;
import 'package:nephroscan/features/ct_scan_screen/domain/repositories/ct_scan_repository.dart'
    as _i764;
import 'package:nephroscan/features/ct_scan_screen/presentation/cubit/ct_scan_upload_cubit/ct_scan_upload_cubit.dart'
    as _i409;
import 'package:nephroscan/features/dashboard_screen/data/datasources/dashboard_remote_datasource.dart'
    as _i829;
import 'package:nephroscan/features/dashboard_screen/data/repositories/dashboard_repository_impl.dart'
    as _i679;
import 'package:nephroscan/features/dashboard_screen/domain/repositories/dashboard_repository.dart'
    as _i88;
import 'package:nephroscan/features/dashboard_screen/presentation/cubit/nav_bar_cubit/nav_bar_cubit.dart'
    as _i701;
import 'package:nephroscan/features/dashboard_screen/presentation/cubit/user_info_cubit/user_info_cubit.dart'
    as _i783;
import 'package:nephroscan/features/message_screen/data/datasources/message_remote_datasource.dart'
    as _i805;
import 'package:nephroscan/features/message_screen/data/repositories/message_repository_impl.dart'
    as _i270;
import 'package:nephroscan/features/message_screen/domain/repositories/message_repository.dart'
    as _i335;
import 'package:nephroscan/features/profile_screen/presentation/cubits/get_all_reports_cubit/get_all_reports_cubit.dart'
    as _i392;
import 'package:nephroscan/features/reports_screen/data/datasources/report_remote_datasource.dart'
    as _i968;
import 'package:nephroscan/features/reports_screen/data/repositories/report_repository_impl.dart'
    as _i569;
import 'package:nephroscan/features/reports_screen/domain/repositories/report_repository.dart'
    as _i355;
import 'package:nephroscan/features/reports_screen/presentation/cubit/reports_cubit/reports_cubit.dart'
    as _i979;
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
    gh.factory<_i701.NavBarCubit>(() => _i701.NavBarCubit());
    gh.lazySingleton<_i59.FirebaseAuth>(
      () => firebaseInjectableModule.firebaseAuth,
    );
    gh.lazySingleton<_i974.FirebaseFirestore>(
      () => firebaseInjectableModule.firebaseFirestore,
    );
    gh.lazySingleton<_i457.FirebaseStorage>(
      () => firebaseInjectableModule.firebaseStorage,
    );
    gh.lazySingleton<_i15.AppRouter>(() => _i15.AppRouter());
    gh.lazySingleton<_i700.AuthorizedFirebaseClient>(
      () => _i700.AuthorizedFirebaseClient(
        storage: gh<_i974.FirebaseFirestore>(),
        auth: gh<_i59.FirebaseAuth>(),
        firebaseStorage: gh<_i457.FirebaseStorage>(),
      ),
    );
    gh.lazySingleton<_i805.MessageRemoteDataSource>(
      () => _i805.MessageRemoteDataSourceImpl(
        gh<_i700.AuthorizedFirebaseClient>(),
      ),
    );
    gh.lazySingleton<_i1059.AuthFirebaseClient>(
      () => _i1059.AuthFirebaseClient(
        auth: gh<_i59.FirebaseAuth>(),
        storage: gh<_i974.FirebaseFirestore>(),
      ),
    );
    gh.lazySingleton<_i829.DashboardRemoteDataSource>(
      () => _i829.DashboardRemoteDataSourceImpl(
        gh<_i700.AuthorizedFirebaseClient>(),
      ),
    );
    gh.lazySingleton<_i718.CtScanDataSource>(
      () => _i718.CtScanDataSourceImpl(gh<_i700.AuthorizedFirebaseClient>()),
    );
    gh.lazySingleton<_i899.SignUpRemoteDataSource>(
      () => _i899.SignUpRemoteDataSourceImpl(gh<_i1059.AuthFirebaseClient>()),
    );
    gh.lazySingleton<_i335.MessageRepository>(
      () => _i270.MessageRepositoryImpl(
        remoteDataSource: gh<_i805.MessageRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i968.ReportRemoteDatasource>(
      () => _i968.ReportRemoteDatasourceImpl(
        gh<_i700.AuthorizedFirebaseClient>(),
      ),
    );
    gh.lazySingleton<_i355.ReportRepository>(
      () => _i569.ReportRepositoryImpl(
        remoteDataSource: gh<_i968.ReportRemoteDatasource>(),
      ),
    );
    gh.lazySingleton<_i88.DashboardRepository>(
      () => _i679.DashboardRepositoryImpl(
        remoteDataSource: gh<_i829.DashboardRemoteDataSource>(),
      ),
    );
    gh.factory<_i979.ReportsCubit>(
      () => _i979.ReportsCubit(reportRepository: gh<_i355.ReportRepository>()),
    );
    gh.factory<_i783.UserInfoCubit>(
      () => _i783.UserInfoCubit(
        dashboardRepository: gh<_i88.DashboardRepository>(),
      ),
    );
    gh.factory<_i392.GetAllReportsCubit>(
      () => _i392.GetAllReportsCubit(
        dashboardRepository: gh<_i88.DashboardRepository>(),
      ),
    );
    gh.lazySingleton<_i764.CtScanRepository>(
      () => _i100.CtScanRepositoryImpl(
        remoteDataSource: gh<_i718.CtScanDataSource>(),
      ),
    );
    gh.lazySingleton<_i395.SignUpRepository>(
      () => _i363.SignUpRepositoryImpl(gh<_i899.SignUpRemoteDataSource>()),
    );
    gh.factory<_i291.UserSignInCubit>(
      () =>
          _i291.UserSignInCubit(signUpRepository: gh<_i395.SignUpRepository>()),
    );
    gh.factory<_i409.CtScanUploadCubit>(
      () => _i409.CtScanUploadCubit(
        ctScanRepository: gh<_i764.CtScanRepository>(),
      ),
    );
    return this;
  }
}

class _$FirebaseInjectableModule extends _i231.FirebaseInjectableModule {}
