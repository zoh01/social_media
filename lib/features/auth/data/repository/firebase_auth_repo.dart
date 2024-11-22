import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:music_app/features/auth/domain/entities/app_user.dart';
import 'package:music_app/features/auth/domain/repository/auth_repository.dart';

class FirebaseAuthRepo implements AuthRepo {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<AppUSer?> getCurrentUser() async {
    /// get the current logged in user from firebase
    final firebaseUser = firebaseAuth.currentUser;

    /// No user Logged in
    if (firebaseUser == null) {
      return null;
    }

    /// user Exists
    return AppUSer(uid: firebaseUser.uid, email: firebaseUser.email!, name: '');
  }

  @override
  Future<void> logOut() async {
    await firebaseAuth.signOut();
  }

  @override
  Future<AppUSer?> loginWithEmailPassword(String email, String password) async {
    try {
      /// Attempt SignIn
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      /// Create User
      AppUSer user = AppUSer(
        uid: userCredential.user!.uid,
        email: email,
        name: '',
      );

      /// Return User
      return user;
    } catch (e) {
      throw Exception('Login failed: $e');
    }
  }

  @override
  Future<AppUSer?> registerWithEmailPassword(
      String email, String password, String name) async {
    try {
      /// Attempt SignUp
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      /// Create User
      AppUSer user = AppUSer(
        uid: userCredential.user!.uid,
        email: email,
        name: name,
      );

      /// Save User data in firestore
      await firebaseFirestore
          .collection("users")
          .doc(user.uid)
          .set(user.toJson());

      /// Return User
      return user;

      /// Catch any error
    } catch (e) {
      throw Exception('SignUp failed: $e');
    }
  }
}
