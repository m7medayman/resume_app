import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:resume_app/core/Di/di.dart';
import 'package:resume_app/core/auth_provider/requests/request.dart';
import 'package:resume_app/core/resources/failure/failure_handler.dart';
import 'package:resume_app/core/auth_provider/responses/Response.dart';
import 'package:resume_app/core/auth_provider/auth_network_service_provider.dart';

class FireBaseAuthService extends AuthServiceProvider {
  final FirebaseAuth _auth;
  final FailureHandler failureHandler;
  FireBaseAuthService({
    required FirebaseAuth auth,
    required this.failureHandler,
  }) : _auth = auth;

  @override
  Future<AuthResponse> login(LoginRequest request) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: request.email, password: request.password);
      if (userCredential.user == null) {
        throw Exception("Null Auth User");
      }
      String userId = userCredential.user!.uid;
      return getUserAuthInfoWithId(userId);
    } on FirebaseAuthException catch (_) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<AuthResponse> signUp(
      SignUpRequest request, UserInfoDataRequest userDetailsRequest) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
              email: request.email, password: request.password);
      if (userCredential.user == null) {
        throw Exception("Null Auth USer");
      }
      String id = userCredential.user!.uid;
      setUserAuthInfoWithId(id, userDetailsRequest);
      return getUserAuthInfoWithId(id);
    } on FirebaseAuthException catch (_) {
      rethrow;
    }
  }

  Future setUserAuthInfoWithId(
      String id, UserInfoDataRequest userDetailsRequest) async {
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
        print(data);
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

  @override
  Future signOut() async {
    unRigister();
    await _auth.signOut();
  }

  @override
  Future<AuthResponse> autoLogin() {
    var user = _auth.currentUser;
    if (user != null) {
      return getUserAuthInfoWithId(user.uid);
    } else {
      throw Exception("Null Auth User");
    }
  }

  @override
  Future<AuthResponse> updateUserInfo(
      {required String id,
      required UserInfoDataRequest userDetailsRequest}) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .update(userDetailsRequest.toJson());
    return getUserAuthInfoWithId(id);
  }
}
