import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nephroscan/features/dashboard_screen/presentation/cubit/nav_bar_cubit/nav_bar_cubit.dart';

void main() {
  group('NavBarCubit', () {
    test('initial state is 0', () {
      final cubit = NavBarCubit();
      expect(cubit.state, 0);
    });

    blocTest<NavBarCubit, int>(
      'emits new index when updateIndex called',
      build: () => NavBarCubit(),
      act: (cubit) => cubit.updateIndex(2),
      expect: () => [2],
    );
  });
}

