import 'package:rxdart/rxdart.dart';

class PasswordShowBloc {
  final _passwordShowController = PublishSubject<bool>();
  Stream<bool> get passwordShowStream => _passwordShowController.stream;

  void passwordSink(bool value) {
    _passwordShowController.sink.add(value);
  }

  void dispose() {
    _passwordShowController.close();
  }
}

final passwordShowBloc = PasswordShowBloc();
