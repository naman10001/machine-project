import 'package:machine/Src/Api/create_account_api.dart';

import 'package:machine/Src/Modal/api_response.dart';
import 'package:rxdart/rxdart.dart';

class CreateAccountBloc {
  final _createAccountController = PublishSubject<ApiResponse>();

  Stream<ApiResponse> get createAccountStream =>
      _createAccountController.stream;
  final _createAccountOtherInfoController = PublishSubject<ApiResponse>();

  Stream<ApiResponse> get createAccountOtherInfoStream =>
      _createAccountOtherInfoController.stream;

  Future<ApiResponse> createAccountSink({
    required String email,
    required String password,
  }) async {
    ApiResponse apiResponse = await CreateAccountApi()
        .createAccount(email: email, password: password);
    _createAccountController.sink.add(apiResponse);
    return apiResponse;
  }

  Future<ApiResponse> createAccountOtherInfoSink({
    required String email,
    required String date,
  }) async {
    ApiResponse apiResponse = await CreateAccountApi().createAccountOthetInfo(
      email: email,
      date: date,
    );
    _createAccountOtherInfoController.sink.add(apiResponse);
    return apiResponse;
  }

  void dispose() {
    _createAccountController.close();
    _createAccountOtherInfoController.close();
  }
}

final createAccountBloc = CreateAccountBloc();
