import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nephroscan/features/dashboard_screen/presentation/cubit/user_info_cubit/user_info_cubit.dart';
import 'package:nephroscan/features/sign_in_sign_up_screen/data/models/user_model/user_model.dart';

import 'mocks.dart';

void main() {
  late MockDashboardRepository mockDashboardRepository;
  late UserInfoCubit cubit;

  setUp(() {
    mockDashboardRepository = MockDashboardRepository();
    cubit = UserInfoCubit(dashboardRepository: mockDashboardRepository);
  });

  tearDown(() {
    cubit.close();
  });

  group('UserInfoCubit', () {
    final user = UserModel(id: 'u1', name: 'name', email: 'e');

    blocTest<UserInfoCubit, UserInfoState>(
      'emits [loading, success] when getUserInfo succeeds',
      build: () {
        when(() => mockDashboardRepository.getUserInfo())
            .thenAnswer((_) async => user);
        return cubit;
      },
      act: (c) => c.getUserInfo(),
      expect: () => [
        const UserInfoState.loading(),
        UserInfoState.success(user),
      ],
    );

    blocTest<UserInfoCubit, UserInfoState>(
      'emits [loading, error] when repository throws',
      build: () {
        when(() => mockDashboardRepository.getUserInfo())
            .thenThrow(Exception('fail'));
        return cubit;
      },
      act: (c) => c.getUserInfo(),
      expect: () => [
        const UserInfoState.loading(),
        UserInfoState.error('Exception: fail'),
      ],
    );
  });
}
