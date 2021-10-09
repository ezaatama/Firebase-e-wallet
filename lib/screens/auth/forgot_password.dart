import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '/screens/widgets/widgets.dart';
import '/screens/widgets/widgets_auth.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({ Key? key }) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController _email = TextEditingController();
  bool _isLoading = false;

  ///Widget input email
  Widget _inputEmail() {
    return Container(
      child: TextField(
        controller: _email,
        decoration: InputDecoration(hintText: 'Email', helperText: 'Enter your email')),
    );
  }

  ///Widget input Submit
  Widget _inputSubmit() {
    return wInputSubmit(title: 'Send', onPressed: () {
      _loginSementara();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: _isLoading ? wAppLoading() : Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(height: 30,),
                wAuthTitle(
                    title: 'Forgot Password', subTitle: 'Enter your email and we\'ll send you a link \nto reset your password'),
                _inputEmail(),
                SizedBox(height: 30,),
                _inputSubmit( )
              ],
            )),
      ),
    );
  }

  void _loginSementara() async {
    setState(() => _isLoading = true);

    if(_email.text.isNotEmpty){
      setState(() {
       _isLoading = true; 
      });
      print('Berhasil');
      await Future.delayed(Duration(seconds: 2));
      wShowToast('Email Sended! Please check your email to reset password');
      Navigator.pop(context);
      } else {
      print('Gagal');
    }
  }
}