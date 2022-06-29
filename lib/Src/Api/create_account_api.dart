import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:machine/Src/Modal/api_response.dart';

class CreateAccountApi {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  late UserCredential userCredential;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<ApiResponse> createAccount({
    required String email,
    required String password,
  }) async {
    try {
      userCredential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return ApiResponse(
        statusCode: 200,
        massage: 'Account created',
        data: userCredential.user,
      );
    } on FirebaseException catch (e) {
      return ApiResponse(
        statusCode: 400,
        massage: 'No account created',
        data: e.toString(),
      );
    }
  }

  Future<ApiResponse> createAccountOthetInfo({
    required String email,
    required String date,
  }) async {
    try {
      var data = firebaseFirestore.collection('User').add({
        'id': '',
        'email': email,
        'date': date,
      }).then((value) {
        firebaseFirestore.collection('User').doc(value.id).set({
          'id': value.id,
        });
      });

      return ApiResponse(
        statusCode: 200,
        massage: 'Account created',
        data: data,
      );
    } on FirebaseException catch (e) {
      return ApiResponse(
        statusCode: 400,
        massage: 'No account created',
        data: e.toString(),
      );
    }
  }
}
