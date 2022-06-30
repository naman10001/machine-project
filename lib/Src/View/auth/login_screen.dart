import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:machine/Src/Bloc/login_bloc.dart';
import 'package:machine/Src/Constant/Strings.dart';
import 'package:machine/Src/Constant/color_const.dart';
import 'package:machine/Src/Constant/global.dart';
import 'package:machine/Src/Modal/api_response.dart';
import 'package:machine/Src/View/auth/create_account.dart';
import 'package:machine/Src/View/home/home_sacreen.dart';
import 'package:machine/Src/Widget/common_text_style.dart';
import 'package:machine/Src/Widget/common_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isRemeber = false;
  bool isPasswordShow = false;
  final _formKey = GlobalKey<FormState>();
  List<dynamic> userList = [];
  @override
  void initState() {
    super.initState();
    dataFetch();
  }

  void dataFetch() {
    if (prefObject?.containsKey('User') ?? false) {
      List data = json.decode(prefObject!.getString('User').toString());
      _emailController.text = data[0];
      _passwordController.text = data[1];
      isRemeber = data[2];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 10, right: 10),
          color: ColorConst.authBackGround,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _header(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              _authBox(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              _rememberMe(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              _commonButton(),
              Align(
                alignment: Alignment.bottomRight,
                child: _noAccountTextButton(),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _authBox() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CommonTextField(
            controller: _emailController,
            labelText: 'Enter Your Email',
            validator: (value) {
              RegExp regex = Regx.emailRegx;
              if (value!.isEmpty) {
                return 'Enter valid Email';
              } else {
                if (!regex.hasMatch(value)) {
                  return 'Enter valid Email';
                } else {
                  return null;
                }
              }
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          CommonTextField(
            controller: _passwordController,
            labelText: 'Enter Your Password',
            obscureText: !isPasswordShow,
            validator: (value) {
              RegExp regex = Regx.passwordRegx;
              if (value!.isEmpty) {
                return 'Enter Valid Password';
              } else {
                if (!regex.hasMatch(value)) {
                  return 'Enter Valid Password';
                } else {
                  return null;
                }
              }
            },
            suffixIcon: IconButton(
              icon: Icon(
                !isPasswordShow ? Icons.visibility_off : Icons.visibility,
                color: ColorConst.black,
              ),
              onPressed: () {
                setState(() {
                  isPasswordShow = !isPasswordShow;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _rememberMe() {
    return Row(
      children: [
        Checkbox(
          value: isRemeber,
          checkColor: ColorConst.white,
          activeColor: ColorConst.black45,
          onChanged: (value) {
            setState(() {
              isRemeber = value!;
            });
          },
        ),
        Text(
          'Remember Me',
          style: TextStyle(
            color: ColorConst.black,
            fontSize: MediaQuery.of(context).size.height * 0.02,
          ),
        )
      ],
    );
  }

  Widget _commonButton() {
    return StreamBuilder<ApiResponse>(
        stream: loginBloc.loginStream,
        builder: (context, snapshot) {
          return MaterialButton(
            onPressed: () async {
              userList = [];
              if (_formKey.currentState!.validate()) {
                ApiResponse response = await loginBloc.loginSink(
                  email: _emailController.text,
                  password: _passwordController.text,
                );
                if (response.statusCode == 200) {
                  if (isRemeber) {
                    userList.add(_emailController.text);
                    userList.add(_passwordController.text);
                    userList.add(isRemeber);
                    prefObject!.setString('User', json.encode(userList));
                  } else {
                    userList.clear();
                    prefObject!.remove('User');
                  }

                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const HomeScreen()),
                      (route) => false);
                }
              } else {
                _errorDailog();
              }
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              'Login',
              style: TextStyle(
                  color: ColorConst.white,
                  fontSize: MediaQuery.of(context).size.height * 0.03),
            ),
            color: ColorConst.black45,
            minWidth: MediaQuery.of(context).size.width / 1.5,
            height: 57,
          );
        });
  }

  Future<void> _errorDailog() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error for user'),
          content: const Text('Wrong Creadentials'),
          actions: [
            MaterialButton(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              color: ColorConst.amber,
              child: const Text(Strings.ok),
            ),
          ],
        );
      },
    );
  }

  Widget _noAccountTextButton() {
    return TextButton(
      onPressed: () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => const CreateAccount()),
            (route) => false);
      },
      child: Text(
        'Don\'t have an account?',
        style: textStyle(context: context),
      ),
    );
  }

  Widget _header() {
    return Container(
      height: 100,
      width: 250,
      transform: Matrix4.skewY(-0.1),
      decoration: BoxDecoration(
        color: ColorConst.black45,
        border: Border.all(color: ColorConst.black45),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          'WELCOME BACK \n\n EMRO CALC',
          style: TextStyle(
            color: ColorConst.white,
            fontSize: MediaQuery.of(context).size.height * 0.03,
          ),
        ),
      ),
    );
  }
}
