import 'package:firebase_auth/firebase_auth.dart';

class AuthChecker {
  final FirebaseAuth firebaseAuth;

  AuthChecker({required this.firebaseAuth});
  bool check() {
    User? user = firebaseAuth.currentUser;
    // firebaseAuth.((user) {
    if (user != null) {
      //if there isn't any user currentUser function returns a null so we should check this case.
      return true;
    } else {
      return false;
    }
  }
}
