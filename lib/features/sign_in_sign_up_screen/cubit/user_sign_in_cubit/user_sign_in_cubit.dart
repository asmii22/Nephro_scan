import 'dart:developer' as dev;

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/firebase_client/auth_firebase_client.dart';
import '../../data/models/user_model/user_model.dart';
import '../../domain/repositories/sign_up_repository.dart';

part 'user_sign_in_cubit.freezed.dart';
part 'user_sign_in_state.dart';

@injectable
class UserSignInCubit extends Cubit<UserSignInState> {
  UserSignInCubit({required SignUpRepository signUpRepository})
    : _signUpRepository = signUpRepository,
      super(const UserSignInState.initial());

  final SignUpRepository _signUpRepository;

  Future<void> signUpUser({
    required String email,
    required String password,
    UserModel? userModel,
  }) async {
    dev.log('🔵 SignUp: Emitting loading state');
    emit(const UserSignInState.loading());
    try {
      dev.log('🔵 SignUp: Calling repository signUpUser');
      await _signUpRepository.signUpUser(
        email: email,
        password: password,
        userModel: userModel,
      );
      dev.log('🔵 SignUp: Success! Emitting signUp state');
      emit(const UserSignInState.signUp());
    } catch (e) {
      dev.log('🔴 SignUp: Error occurred: $e');
      if (e is AuthFailure) {
        final message = _mapAuthFailureToMessage(e.code, e.message);
        dev.log('🔴 SignUp: Emitting error state with message: $message');
        emit(UserSignInState.error(message));
      } else {
        dev.log(
          '🔴 SignUp: Emitting error state with message: ${e.toString()}',
        );
        emit(UserSignInState.error(e.toString()));
      }
    }
  }

  Future<void> signInUser({
    required String email,
    required String password,
  }) async {
    dev.log('🔵 SignIn: Emitting loading state');
    emit(const UserSignInState.loading());
    try {
      dev.log('🔵 SignIn: Calling repository signInUser');
      await _signUpRepository.signInUser(email, password);
      dev.log('🔵 SignIn: Success! Emitting signIn state');
      emit(const UserSignInState.signIn());
    } catch (e) {
      dev.log('🔴 SignIn: Error occurred: $e');
      if (e is AuthFailure) {
        final message = _mapAuthFailureToMessage(e.code, e.message);
        dev.log('🔴 SignIn: Emitting error state with message: $message');
        emit(UserSignInState.error(message));
      } else {
        dev.log(
          '🔴 SignIn: Emitting error state with message: ${e.toString()}',
        );
        emit(UserSignInState.error(e.toString()));
      }
    }
  }

  Future<void> signOut() async {
    dev.log('🔵 SignOut: Emitting loading state');
    emit(const UserSignInState.loading());
    try {
      dev.log('🔵 SignOut: Calling repository signOut');
      await _signUpRepository.signOut();
      dev.log('🔵 SignOut: Success! Emitting signOut state');
      emit(const UserSignInState.signOut());
    } catch (e) {
      dev.log('🔴 SignOut: Error occurred: $e');
      if (e is AuthFailure) {
        final message = _mapAuthFailureToMessage(e.code, e.message);
        dev.log('🔴 SignOut: Emitting error state with message: $message');
        emit(UserSignInState.error(message));
      } else {
        dev.log(
          '🔴 SignOut: Emitting error state with message: ${e.toString()}',
        );
        emit(UserSignInState.error(e.toString()));
      }
    }
  }

  String? _mapAuthFailureToMessage(String code, String message) {
    switch (code) {
      case 'wrong-password':
        return 'Incorrect password. Please try again.';
      case 'user-not-found':
        return 'No user found for that email.';
      case 'invalid-email':
        return 'The email address is not valid.';
      case 'user-disabled':
        return 'This user account has been disabled.';
      case 'too-many-requests':
        return 'Too many attempts. Try again later.';
      case 'invalid-credential':
        return 'Invalid credentials. Please check your email and password.';
      case 'firestore_error':
        return message; // Return the detailed message from Firestore
      case 'email-already-in-use':
        return 'This email is already registered. Please sign in instead.';
      default:
        return message;
    }
  }
}
