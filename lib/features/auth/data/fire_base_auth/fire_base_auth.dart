import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/src/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:resume_app/core/resources/failure.dart';
import 'package:resume_app/features/auth/data/Response.dart';
import 'package:resume_app/features/auth/data/fire_base_auth/failure_handler.dart';
import 'package:resume_app/features/auth/data/network_service_provider.dart';
import 'package:resume_app/features/auth/data/request.dart';

class AuthService extends NetworkServiceProvider {
  final FirebaseAuth _auth;
  final FailureHandler failureHandler;
  AuthService({
    required FirebaseAuth auth,
    required this.failureHandler,
  }) : _auth = auth;

  @override
  Future<AuthResponse> login(LoginRequest request) async {
    try {
      UserCredential _userCredential = await _auth.signInWithEmailAndPassword(
          email: request.email, password: request.password);
      if (_userCredential.credential == null) {
        throw Exception("Null Auth USer");
      }
      String _userId = _userCredential.credential!.providerId;
      return getUserAuthInfoWithId(_userId);
    } catch (e) {
      if (e is FirebaseAuthException) {
        throw Exception(e.code);
      }
      rethrow;
    }
  }

  @override
  Future<AuthResponse> signUp(SignUpRequest request,
      SignUpRequestUserDetails userDetailsRequest) async {
    UserCredential _userCredential = await _auth.createUserWithEmailAndPassword(
        email: request.email, password: request.password);
    if (_userCredential.credential == null) {
      throw Exception("Null Auth USer");
    }
    String _id = _userCredential.credential!.providerId;
    setUserAuthInfoWithId(_id, userDetailsRequest);
    return getUserAuthInfoWithId(_id);
  }

  Future setUserAuthInfoWithId(
      String id, SignUpRequestUserDetails userDetailsRequest) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .set(userDetailsRequest.toJson());
  }

  Future<AuthResponse> getUserAuthInfoWithId(String id) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
          await FirebaseFirestore.instance.collection('users').doc(id).get();

      if (documentSnapshot.exists) {
        Map<String, dynamic>? data = documentSnapshot.data();
        if (data != null) {
          return AuthResponse.fromJson(data);
        } else {
          throw Exception("Null user data");
        }
      } else {
        throw Exception("Null Auth User  Doc");
      }
    } catch (e) {
      if (e is FirebaseException) {
        throw Exception(e.code);
      } else {
        rethrow;
      }
    }
  }
}
