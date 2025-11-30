import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../../features/sign_in_sign_up_screen/data/models/user_model/user_model.dart';

class AuthFailure implements Exception {
  final String code;
  final String message;
  AuthFailure({required this.code, required this.message});

  @override
  String toString() => 'AuthFailure(code: $code, message: $message)';
}

@lazySingleton
class AuthFirebaseClient {
  final FirebaseAuth _auth;
  final FirebaseFirestore _storage;

  AuthFirebaseClient({FirebaseAuth? auth, FirebaseFirestore? storage})
    : _auth = auth ?? FirebaseAuth.instance,
      _storage = storage ?? FirebaseFirestore.instance;

  Future<UserCredential> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential;
    } on FirebaseAuthException catch (e) {
      throw AuthFailure(code: e.code, message: e.message ?? 'Sign in failed');
    } catch (e) {
      throw AuthFailure(code: 'unknown', message: e.toString());
    }
  }

  Future<UserCredential?> signUp({
    required String email,
    required String password,
    UserModel? userModel,
  }) async {
    try {
      // Create Firebase Auth user
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      try {
        final uid = credential.user?.uid;
        final collection = _storage.collection('users');
        final updatedUser = userModel?.copyWith(id: uid ?? '');

        await collection.doc(uid).set(updatedUser?.toJson() ?? {}).whenComplete(
          () {
            log('User profile created in Firestore with UID: $uid');
          },
        );
      } catch (firestoreError) {
        log(
          'Firestore error: $firestoreError',
        ); // Log the full error for better debugging
        throw AuthFailure(
          code: 'firestore_error',
          message: 'Failed to create user profile: $firestoreError',
        );
      }
      return credential;
    } on FirebaseAuthException catch (e) {
      throw AuthFailure(code: e.code, message: e.message ?? 'Sign up failed');
    } catch (e) {
      log('Unknown error: $e');
      try {
        await _auth.currentUser?.delete();
      } catch (_) {
        // Ignore deletion errors
      }
      throw AuthFailure(code: 'unknown', message: e.toString());
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      throw AuthFailure(code: 'sign_out_failed', message: e.toString());
    }
  }
}
