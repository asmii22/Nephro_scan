import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:nephroscan/features/sign_in_sign_up_screen/data/models/user_model/user_model.dart';

class FirestoreFailure implements Exception {
  final String message;
  FirestoreFailure(this.message);

  @override
  String toString() => 'FirestoreFailure: $message';
}

@lazySingleton
class FirestoreClient {
  final FirebaseFirestore _firestore;

  FirestoreClient({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  /// Create a user document in Firestore
  Future<void> createUserDocument({
    required String userId,
    required String email,
    String? name,
    String? phoneNumber,
    String? address,
    UserRole? role,
  }) async {
    try {
      final userModel = UserModel(
        id: userId,
        email: email,
        name: name,
        phoneNumber: phoneNumber,
        address: address,
        role: role ?? UserRole.patient, // Default to patient
        profilePicture: null,
      );

      await _firestore.collection('users').doc(userId).set(userModel.toJson());
    } on FirebaseException catch (e) {
      throw FirestoreFailure(e.message ?? 'Failed to create user document');
    } catch (e) {
      throw FirestoreFailure(e.toString());
    }
  }

  /// Get a user document from Firestore
  Future<UserModel?> getUserDocument(String userId) async {
    try {
      final doc = await _firestore.collection('users').doc(userId).get();

      if (!doc.exists || doc.data() == null) {
        return null;
      }

      return UserModel.fromJson(doc.data()!);
    } on FirebaseException catch (e) {
      throw FirestoreFailure(e.message ?? 'Failed to get user document');
    } catch (e) {
      throw FirestoreFailure(e.toString());
    }
  }

  /// Update a user document in Firestore
  Future<void> updateUserDocument({
    required String userId,
    required Map<String, dynamic> updates,
  }) async {
    try {
      await _firestore.collection('users').doc(userId).update(updates);
    } on FirebaseException catch (e) {
      throw FirestoreFailure(e.message ?? 'Failed to update user document');
    } catch (e) {
      throw FirestoreFailure(e.toString());
    }
  }

  /// Delete a user document from Firestore
  Future<void> deleteUserDocument(String userId) async {
    try {
      await _firestore.collection('users').doc(userId).delete();
    } on FirebaseException catch (e) {
      throw FirestoreFailure(e.message ?? 'Failed to delete user document');
    } catch (e) {
      throw FirestoreFailure(e.toString());
    }
  }
}
