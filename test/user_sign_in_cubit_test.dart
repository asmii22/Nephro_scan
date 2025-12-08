import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nephroscan/features/sign_in_sign_up_screen/cubit/user_sign_in_cubit/user_sign_in_cubit.dart';
import 'package:nephroscan/features/sign_in_sign_up_screen/data/models/user_model/user_model.dart';
import 'package:nephroscan/core/firebase_client/auth_firebase_client.dart';

import 'mocks.dart';

void main() {
  late MockSignUpRepository mockSignUpRepository;
  late UserSignInCubit cubit;

  setUp(() {
    mockSignUpRepository = MockSignUpRepository();
    cubit = UserSignInCubit(signUpRepository: mockSignUpRepository);
  });

  tearDown(() {
    cubit.close();
  });

  group('UserSignInCubit', () {
    const email = 'a@b.com';
    const password = 'pass';
    final user = UserModel(id: 'u', name: 'n', email: 'e');

    blocTest<UserSignInCubit, UserSignInState>(
      'signUp emits [loading, signUp] on success',
      build: () {
        when(() => mockSignUpRepository.signUpUser(
          email: any(named: 'email'),
          password: any(named: 'password'),
          userModel: any(named: 'userModel'),
        )).thenAnswer((_) async {});
        return cubit;
      },
      act: (c) => c.signUpUser(email: email, password: password, userModel: user),
      expect: () => [
        const UserSignInState.loading(),
        const UserSignInState.signUp(),
      ],
    );

    blocTest<UserSignInCubit, UserSignInState>(
      'signUp emits error when repository throws generic',
      build: () {
        when(() => mockSignUpRepository.signUpUser(
          email: any(named: 'email'),
          password: any(named: 'password'),
          userModel: any(named: 'userModel'),
        )).thenThrow(Exception('x'));
        return cubit;
      },
      act: (c) => c.signUpUser(email: email, password: password, userModel: user),
      expect: () => [
        const UserSignInState.loading(),
        UserSignInState.error('Exception: x'),
      ],
    );

    blocTest<UserSignInCubit, UserSignInState>(
      'signUp maps AuthFailure code to message',
      build: () {
        when(() => mockSignUpRepository.signUpUser(
          email: any(named: 'email'),
          password: any(named: 'password'),
          userModel: any(named: 'userModel'),
        )).thenAnswer((_) async { throw AuthFailure(code: 'wrong-password', message: 'pw'); });
        return cubit;
      },
      act: (c) => c.signUpUser(email: email, password: password, userModel: user),
      expect: () => [
        const UserSignInState.loading(),
        UserSignInState.error('Incorrect password. Please try again.'),
      ],
    );

    blocTest<UserSignInCubit, UserSignInState>(
      'signIn emits [loading, signIn] on success',
      build: () {
        when(() => mockSignUpRepository.signInUser(any(), any()))
            .thenAnswer((_) async {});
        return cubit;
      },
      act: (c) => c.signInUser(email: email, password: password),
      expect: () => [
        const UserSignInState.loading(),
        const UserSignInState.signIn(),
      ],
    );

    blocTest<UserSignInCubit, UserSignInState>(
      'signOut emits [loading, signOut] on success',
      build: () {
        when(() => mockSignUpRepository.signOut()).thenAnswer((_) async {});
        return cubit;
      },
      act: (c) => c.signOut(),
      expect: () => [
        const UserSignInState.loading(),
        const UserSignInState.signOut(),
      ],
    );
  });
}
