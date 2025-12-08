import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:nephroscan/base/base.dart';
import 'package:nephroscan/features/ct_scan_screen/data/models/report_model.dart';
import 'package:nephroscan/features/sign_in_sign_up_screen/data/models/user_model/user_model.dart';
import 'package:uuid/uuid.dart';

@LazySingleton()
class AuthorizedFirebaseClient {
  final FirebaseFirestore? _storage;
  final FirebaseAuth? _auth;
  final FirebaseStorage? _firebaseStorage;

  AuthorizedFirebaseClient({
    FirebaseFirestore? storage,
    FirebaseAuth? auth,
    FirebaseStorage? firebaseStorage,
  }) : _storage = storage ?? FirebaseFirestore.instance,
       _auth = auth ?? FirebaseAuth.instance,
       _firebaseStorage = firebaseStorage ?? FirebaseStorage.instance;

  String? get currentUserId => _auth?.currentUser?.uid;

  Future<String?> uploadImage(File? file) async {
    try {
      if (file == null) {
        throw Exception('File is null');
      }
      final String imageId = const Uuid().v4();
      final ref = _firebaseStorage?.ref().child('images/$imageId.jpg');
      final uploadTask = await ref?.putFile(file);
      final String? downloadUrl = await uploadTask?.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      throw Exception('Image upload failed: $e');
    }
  }

  Future<void> uploadReport(ReportModel? report, File? file) async {
    try {
      final String reportId = const Uuid().v4();
      if (report == null || file == null) {
        throw Exception('Report is null');
      }
      final ctScanImageUrl = await uploadImage(file);
      final updatedReport = report.copyWith(
        id: reportId,
        ctScanImageUrl: ctScanImageUrl,
        patientId: currentUserId,
      );
      final collection = _storage?.collection(AppStrings.reportCollection);
      await collection?.doc(reportId).set(updatedReport.toJson()).whenComplete(
        () {
          _storage
              ?.collection(AppStrings.usersCollection)
              .doc(currentUserId)
              .update({
                'reports': FieldValue.arrayUnion([reportId]),
              });
        },
      );
    } catch (e) {
      throw Exception('Report upload failed: $e');
    }
  }

  Future<UserModel?> getUserInfo() async {
    try {
      final uid = currentUserId;
      if (uid == null) {
        throw Exception('User is not authenticated');
      }
      final doc = await _storage
          ?.collection(AppStrings.usersCollection)
          .doc(uid)
          .get();
      if (doc == null || !doc.exists) {
        throw Exception('User document does not exist');
      }
      final data = doc.data();
      if (data != null) {
        return UserModel.fromJson(data);
      }
      // Process user data as needed
    } catch (e) {
      throw Exception('Failed to get user info: $e');
    }
    return null;
  }

  Future<List<ReportModel>?> getReportsByIds(List<String>? reportIds) async {
    try {
      if (reportIds == null || reportIds.isEmpty) {
        return [];
      }
      final collection = _storage?.collection(AppStrings.reportCollection);
      final querySnapshot = await collection
          ?.where('id', whereIn: reportIds)
          .get();
      final reports = querySnapshot?.docs.map((doc) {
        final data = doc.data();
        return ReportModel.fromJson(data);
      }).toList();
      return reports;
    } catch (e) {
      throw Exception('Failed to get reports: $e');
    }
  }

  Future<List<String>> getReportDocIds() async {
    final query = await FirebaseFirestore.instance.collection('reports').get();

    return query.docs.map((doc) => doc.id).toList();
  }
}
