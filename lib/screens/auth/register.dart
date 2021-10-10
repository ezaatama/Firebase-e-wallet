import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wallet/screens/auth/verif_email.dart';
import '/screens/widgets/widgets_auth.dart';
import '/screens/home/home.dart';
import '/screens/widgets/widgets.dart';
import 'login.dart';

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
        Expanded(
          child: TextField(
            obscureText: true,
                controller: _password,
                decoration: InputDecoration(hintText: '******', helperText: 'Password'),
            ),
        ),
        SizedBox(width: 20),
        Expanded(
          child: TextField(
            obscureText: true,
                controller: _passwordConfirm,
            decoration: InputDecoration(hintText: '******', helperText: 'Confirm Password'),
          ),
        )
      ],
    );
  }

  ///Widget input Submit
  Widget _inputSubmit() {
    return wInputSubmit(title: 'Register', onPressed:
      _registerSementara
    );
  }

  ///Widget Register Google
  Widget _loginGoogle() {
    return wLoginGoogle(onPressed: () {});
  }

  ///Widget Register
  Widget _textLogin() {
    return wTextLink(
      text: "Already have an account ?",
      title: 'Login',
      onTap: () => wPushToReplacement(context, Login())
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: _isLoading ? wAppLoading() : Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  wAuthTitle(
                      title: 'Register', subTitle: 'Fill the form to register'),
                  _inputName(),
                  _inputEmail(),
                  _inputPassword(),
                  SizedBox(height: 30),
                  _inputSubmit(),
                  wTextDivider(),
                  _loginGoogle(),
                  _textLogin(),
                ],
              )),
        ),
      ),
    );
  }

  void _registerSementara() async {

    print('Fullname: ${_name.text}');
    print('Email: ${_email.text}');
    print('Password: ${_password.text}');
    print('Confirm Password: ${_passwordConfirm.text}');

    setState(() => _isLoading = true);

    await Future.delayed(Duration(seconds: 2));
     wPushToReplacement(context, Login());

     showModalBottomSheet(
       isScrollControlled: true,
       backgroundColor: Colors.transparent,
       context: context, builder: (context) {
       return VerifEmail();
     });
  }
}
