import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/screens/auth/forgot_password.dart';
import '/screens/widgets/widgets_auth.dart';
import '/screens/home/home.dart';
import '/screens/widgets/widgets.dart';
import 'register.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool _obscureText = true;
  bool _isLoading = false;

  ///Widget input email
  Widget _inputEmail() {
    return Container(
      child: TextField(
        controller: _email,
        decoration: InputDecoration(hintText: 'Email')),
    );
  }

  ///Widget input Password
  Widget _inputPassword() {
    return Stack(
      children: [
        Container(
            child: TextField(
              controller: _password,
              obscureText: _obscureText,
          decoration: InputDecoration(hintText: 'Password'),
        )),
        Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              onPressed: () {
                setState(() =>
                  _obscureText = !_obscureText
                );
              },
              icon: Icon( _obscureText ? Icons.visibility_off : Icons.visibility, color: Colors.grey),
            ))
      ],
    );
  }

  ///Widget forgot Password
  Widget _forgotPassword() {
    return GestureDetector(
      child: Container(
          alignment: Alignment.centerLeft,
          child: Container(
              color: Colors.transparent,
              padding: EdgeInsets.fromLTRB(0, 20, 20, 20),
              child: Text('Forgot Password?'))),
      onTap: () => wPushTo(context, ForgotPassword()),
    );
  }

  ///Widget input Submit
  Widget _inputSubmit() {
    return wInputSubmit(title: 'Login', onPressed: () {
      _loginSementara();
    });
  }

  ///Widget login Google
  Widget _loginGoogle() {
    return wLoginGoogle(onPressed: () {});
  }

  ///Widget Register
  Widget _textRegister() {
    return wTextLink(
      text: "Don't have an account yet ?",
      title: 'Register',
      onTap: () => wPushToReplacement(context, Register())
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: _isLoading ? wAppLoading() : Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                wAuthTitle(
                    title: 'Login', subTitle: 'Enter your email & password'),
                _inputEmail(),
                _inputPassword(),
                _forgotPassword(),
                _inputSubmit(),
                wTextDivider(),
                _loginGoogle(),
                _textRegister(),
              ],
            )),
      ),
    );
  }

  void _loginSementara() async {
    setState(() => _isLoading = true);

    if(_email.text == 'eza@gmail.com' && _password.text == '123123'){
      await Future.delayed(Duration(seconds: 3));
      wPushToReplacement(context, Home());
    } else {
      print('Gagal');
    }
  }
}
