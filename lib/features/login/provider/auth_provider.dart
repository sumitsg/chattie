import 'dart:developer';

import 'package:chattie/common/utils/constants.dart';
import 'package:chattie/common/utils/preferances/app_preferances.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:shared_preferences/shared_preferences.dart';

enum Status {
  uninitialized,
  authenticated,
  authenticating,
  authenticateError,
  authenticateCanceled,
}

class AuthProvider extends ChangeNotifier {
  final GoogleSignIn googleSignIn;
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;
  // final AppPreferances prefs;

  // ignore: prefer_final_fields
  Status _status = Status.uninitialized;

  Status get status => _status;

  AuthProvider({
    required this.googleSignIn,
    required this.firebaseAuth,
    required this.firebaseFirestore,
    // required this.prefs,
  });

  Future<bool> signInWithGoogle() async {
    _status = Status.authenticating;
    notifyListeners();

    GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    if (googleUser != null) {
      GoogleSignInAuthentication? authentication =
          await googleUser.authentication;

      //Create a new [GoogleAuthCredential] from a provided [accessToken].
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: authentication.accessToken,
        idToken: authentication.idToken,
      );

      //Asynchronously signs in to Firebase with
      //the given 3rd-party credentials
      //(e.g. a Facebook login Access Token, a Google ID Token/Access Token pair, etc.)
      // and returns additional identity provider data.
      UserCredential? userCredential =
          await firebaseAuth.signInWithCredential(credential);

      //
      if (userCredential != null) {
        //Fetch the documents for this query.
        // passed the collection name i.e. "Users"
        //check if id is equal to user id from the credentials
        final QuerySnapshot result = await firebaseFirestore
            .collection(FirestoreConstants.pathUserCollection)
            .where(FirestoreConstants.id, isEqualTo: userCredential.user?.uid)
            .get();

        // get the list of document including snapshot
        final List<DocumentSnapshot> document = result.docs;

        //
        if (document.isEmpty) {
          // store the values to the firebase collection / database
          firebaseFirestore
              .collection(FirestoreConstants.pathUserCollection)
              .doc(userCredential.user?.uid)
              .set({
            FirestoreConstants.displayName:
                userCredential.user?.displayName ?? "",
            FirestoreConstants.photoUrl: userCredential.user?.photoURL ?? "",
            FirestoreConstants.id: userCredential.user?.uid,
            "createdAt": DateTime.now().millisecondsSinceEpoch.toString(),
            FirestoreConstants.chattingWith: null,
          });
          log("Data is :--$document ");
          return true;
        } else {
          print("Already loggined....");
        }
      }
    }

    return false;
  }
}
