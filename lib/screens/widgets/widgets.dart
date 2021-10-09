import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

import 'package:fluttertoast/fluttertoast.dart';

///Widget Aplikasi Loading
Widget wAppLoading() {
  return Center(
      child: Platform.isIOS
          ? CupertinoActivityIndicator()
          : CircularProgressIndicator());
}

///Widget input Submit
Widget wInputSubmit({String title = '', Function()? onPressed}) {
  return Container(
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Colors.blue, shape: StadiumBorder()),
          onPressed: onPressed,
          child: Text(title, style: TextStyle(color: Colors.white))));
}

//Navigator Push
Future wPushTo(BuildContext context, Widget widget){
  return Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}

//Navigator PushReplacement
Future wPushToReplacement(BuildContext context, Widget widget){
  return Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => widget));
}

Future wShowToast(String msg){
  return Fluttertoast.showToast(msg: msg,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_LONG
      );
}