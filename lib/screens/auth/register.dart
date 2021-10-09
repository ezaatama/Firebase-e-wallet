import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/screens/widgets/widgets_auth.dart';
import '/screens/home/home.dart';
import '/screens/widgets/widgets.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _passwordConfirm = TextEditingController();
  
  bool _isLoading = false;

  ///Widget input name
  Widget _inputName() {
    return Container(
      child: TextField(
        controller: _name,
        decoration: InputDecoration(hintText: 'Name', helperText:'Enter Full Name')),
    );
  }

  ///Widget input email
  Widget _inputEmail() {
    return Container(
      child: TextField(
        controller: _email,
        decoration: InputDecoration(hintText: 'Email', helperText: 'Enter Email')),
    );
  }

  ///Widget input Password
  Widget _inputPassword() {
    return Row(
      children: [
        TextField(
              controller: _password,
              decoration: InputDecoration(hintText: 'Password', helperText: 'Enter Password'),
          ),
        TextField(
              controller: _passwordConfirm,
          decoration: InputDecoration(hintText: 'Password', helperText: 'Confirm Password'),
        )
      ],
    );
  }

  ///Widget input Submit
  Widget _inputSubmit() {
    return wInputSubmit(title: 'Register', onPressed: () {
      _registerSementara;
    });
  }

  ///Widget Register Google
  Widget _loginGoogle() {
    return wLoginGoogle(onPressed: () {});
  }

  ///Widget Register
  Widget _textRegister() {
    return wTextLink(
      text: "Don't have an account yet ?",
      title: 'Register',
      onTap: (){}
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
                    title: 'Register', subTitle: 'Enter your email & password'),
                _inputEmail(),
                _inputPassword(),
                _inputSubmit(),
                wTextDivider(),
                _loginGoogle(),
                _textRegister(),
              ],
            )),
      ),
    );
  }

  void _registerSementara() async {
    setState(() => _isLoading = true);

    if(_email.text == 'eza@gmail.com' && _password.text == '123123'){
      await Future.delayed(Duration(seconds: 3));
      wPushToReplacement(context, Home());
    } else {
      print('Gagal');
    }
  }
}
