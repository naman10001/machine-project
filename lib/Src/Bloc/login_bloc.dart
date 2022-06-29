import 'package:machine/Src/Api/login_api.dart';
import 'package:machine/Src/Modal/api_response.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc {
  final _loginController = PublishSubject<ApiResponse>();

  Stream<ApiResponse> get loginStream => _loginController.stream;

  Future<ApiResponse> loginSink({
    required String email,
    required String password,
  }) async {
    ApiResponse apiResponse =
        await LoginApi().loginUser(email: email, password: password);
    _loginController.sink.add(apiResponse);
    return apiResponse;
  }

  void dispose() {
    _loginController.close();
  }
}

final loginBloc = LoginBloc();
