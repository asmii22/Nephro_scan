import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nephroscan/features/dashboard_screen/presentation/cubit/nav_bar_cubit/nav_bar_cubit.dart';

void main() {
  late NavBarCubit cubit;

  setUp(() {
    cubit = NavBarCubit();
  });

  tearDown(() {
    cubit.close();
  });

  group('NavBarCubit', () {
    test('initial state is 0', () {
      expect(cubit.state, 0);
    });

    blocTest<NavBarCubit, int>(
      'emits new index when updateIndex is called',
      build: () => NavBarCubit(),
      act: (c) => c.updateIndex(2),
      expect: () => [2],
    );

    blocTest<NavBarCubit, int>(
      'emits multiple indices when updateIndex called multiple times',
      build: () => NavBarCubit(),
      act: (c) {
        c.updateIndex(1);
        c.updateIndex(3);
        c.updateIndex(0);
      },
      expect: () => [1, 3, 0],
    );
  });
}

