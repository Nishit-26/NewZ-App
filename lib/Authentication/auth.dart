import 'package:firebase_auth/firebase_auth.dart';
import 'package:newzapp/Models/user_model.dart';

class AuthService {
  final FirebaseAuth _auth;

  AuthService(this._auth);

  Stream<User?> get authStateChanges => _auth.idTokenChanges();

  Future<String> login(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return "Signup ";
    } catch (e) {
      return e.toString();
    }
  }
}
