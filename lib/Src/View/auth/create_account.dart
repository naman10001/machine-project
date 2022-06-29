import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:machine/Src/Bloc/create_account_bloc.dart';
import 'package:machine/Src/Bloc/password_show_bloc.dart';
import 'package:machine/Src/Constant/Strings.dart';
import 'package:machine/Src/Constant/color_const.dart';
import 'package:machine/Src/Constant/global.dart';
import 'package:machine/Src/Modal/api_response.dart';
import 'package:machine/Src/View/auth/login_screen.dart';
import 'package:machine/Src/View/home/home_sacreen.dart';
import 'package:machine/Src/Widget/common_text_style.dart';
import 'package:machine/Src/Widget/common_textfield.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _reConfpassController = TextEditingController();
  bool isPasswordShow = false;
  bool isRePasswordShow = false;
  final _formKey = GlobalKey<FormState>();

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
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              _commonButton(),
              Align(
                alignment: Alignment.bottomRight,
                child: _haveAccountTextButton(),
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
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          CommonTextField(
            controller: _reConfpassController,
            labelText: 'Re-confirm Your Password',
            obscureText: !isRePasswordShow,
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
                !isRePasswordShow ? Icons.visibility_off : Icons.visibility,
                color: ColorConst.black,
              ),
              onPressed: () {
                setState(() {
                  isRePasswordShow = !isRePasswordShow;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _commonButton() {
    return StreamBuilder<ApiResponse>(
        stream: createAccountBloc.createAccountStream,
        builder: (context, snapshot) {
          return MaterialButton(
            onPressed: () async {
              if (_formKey.currentState!.validate() &&
                  _passwordController.text == _reConfpassController.text) {
                ApiResponse response =
                    await createAccountBloc.createAccountSink(
                  email: _emailController.text,
                  password: _passwordController.text,
                );
                if (response.statusCode == 200) {
                  await createAccountBloc.createAccountOtherInfoSink(
                    email: _emailController.text,
                    date: DateTime.now().toIso8601String(),
                  );
                  prefObject!.setString('id', json.decode(response.data));

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
              'Create Account',
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

  Widget _haveAccountTextButton() {
    return TextButton(
      onPressed: () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => const LoginScreen()),
            (route) => false);
      },
      child: Text(
        'Already have an account?',
        style: textStyle(context: context),
      ),
    );
  }

  Future<void> _errorDailog() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error for user'),
          content: const Text('No Account Cretaed'),
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
          'Create Account',
          style: TextStyle(
            color: ColorConst.white,
            fontSize: MediaQuery.of(context).size.height * 0.03,
          ),
        ),
      ),
    );
  }
}
