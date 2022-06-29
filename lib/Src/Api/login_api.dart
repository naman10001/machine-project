import 'package:firebase_auth/firebase_auth.dart';
import 'package:machine/Src/Modal/api_response.dart';

class LoginApi {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  late UserCredential userCredential;
  Future<ApiResponse> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      userCredential = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return ApiResponse(
        statusCode: 200,
        massage: 'User login',
        data: userCredential.user,
      );
    } on FirebaseException catch (e) {
      return ApiResponse(
        statusCode: 400,
        massage: ' No User login',
        data: e.toString(),
      );
    }
  }
}
