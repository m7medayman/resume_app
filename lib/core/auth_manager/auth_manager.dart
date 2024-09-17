import 'package:firebase_auth/firebase_auth.dart';

class FireBaseAuth {
  final FirebaseAuth _auth;
  FireBaseAuth({
    required auth,
  }) : _auth = auth;

  User? getAuth() {
    return _auth.currentUser;
  }
}
