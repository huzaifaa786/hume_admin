import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:get/get.dart';
import 'package:hume_admin/routes/app_routes.dart';
import 'package:hume_admin/utils/controller_initlization.dart';

class AuthService extends GetxController {
  static AuthService get instance => Get.find();

  //Variables
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  String usersCollection = "users";

  //Will be load when app launches this func will be called and set the firebaseUser state
  @override
  void onInit() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
    super.onInit();
  }

  /// If we are setting initial screen from here
  /// then in the main.dart => App() add CircularProgressIndicator()
  _setInitialScreen(User? user) {
    print(user);
    user == null
        ? Get.offAllNamed(AppRoutes.welcome)
        : Get.offAllNamed(AppRoutes.home);
  }

  // _addUserToFirestore(String userID) async {}

  Future<String?> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      var userData = await firebaseFirestore
          .collection(usersCollection)
          .where('email', isEqualTo: email)
          .where('isAdmin', isEqualTo: true)
          .get();

      if (userData.docs.isNotEmpty) {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((value) async {
          if (value.user != null) {
            String userID = value.user!.uid;
            final token = await FirebaseMessaging.instance.getToken();

            // Update user token
            await firebaseFirestore
                .collection(usersCollection)
                .doc(userID)
                .update({
              'token': token,
            });
          } else {
            return 'Login failed';
          }
        });
      } else {
        return 'Invalid credentials!';
      }
    } on FirebaseAuthException catch (e) {
      return e.message;
    } catch (_) {
      return 'Login failed';
    }
    return null;
  }

  Future<void> logout() async => await _auth.signOut();
}
