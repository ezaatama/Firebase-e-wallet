import 'package:flutter/material.dart';

class VerifEmail extends StatefulWidget {
  const VerifEmail({Key? key}) : super(key: key);

  @override
  _VerifEmailState createState() => _VerifEmailState();
}

class _VerifEmailState extends State<VerifEmail> {
  bool _isLoading = false;
  bool _isSended = false;

  Widget _resendEmailButton() {
    return Column(
      children: [
        Text('Did\'t receive an email?'),
        TextButton(
            onPressed: () async {
              setState(() {
                _isLoading = true;
              });

              await Future.delayed(Duration(seconds: 2));

              setState(() {
                _isLoading = false;
                _isSended = true;
              });
            },
            child: Text( _isLoading ? 'Sending' : 'Resend'))
      ],
    );
  }

  Widget _resendEmailMsg() {
    return Container(
        child: Text('Email Sended!', style: TextStyle(color: Colors.green)));
  }

  Widget _bottomWidget(){
    return _isSended ? _resendEmailMsg() : _resendEmailButton();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.2,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      child: Stack(
        children: [
          Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.all(10),
              child: Icon(Icons.drag_handle)),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.alternate_email, size: 50),
                SizedBox(height: 20),
                Text(
                  'Verify your email',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  'We have send an email with a confirmation link\n to your email address.',
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 30,
                ),
                Divider(height: 40, indent: 50, endIndent: 50),
                Text(
                  'Please click on that to verify your email\n and continue the register process',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
                Divider(height: 40, indent: 50, endIndent: 50),
                _bottomWidget()
              ],
            ),
          )
        ],
      ),
    );
  }
}
