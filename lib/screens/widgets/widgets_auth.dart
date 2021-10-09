import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

///Widget Title Login
Widget wAuthTitle({String title = '', String subTitle = ''}) {
  return Container(
      width: double.infinity,
      padding: EdgeInsets.only(bottom: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        SizedBox(
          height: 5,
        ),
        Text(subTitle)
      ]));
}

///Widget divider
Widget wTextDivider() {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10),
    child: Row(
      children: [
        Expanded(child: Divider()),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text('Or Connect With',
              style: TextStyle(fontSize: 12, color: Colors.grey)),
        ),
        Expanded(child: Divider())
      ],
    ),
  );
}

///Widget login Google
Widget wLoginGoogle({Function()? onPressed}) {
  return Container(
      width: double.infinity,
      child: ElevatedButton.icon(
        icon: Icon(MdiIcons.google, size: 20),
        label: Text('Google'),
        style: ElevatedButton.styleFrom(shape: StadiumBorder()),
        onPressed: onPressed,
      ));
}

///Widget Text Link
Widget wTextLink({String? text, String? title, Function()? onTap}) {
  return Container(
    margin: EdgeInsets.only(top: 40),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text!),
        GestureDetector(
          child: Container(
              padding: EdgeInsets.all(10),
              child:
                  Text(title!, style: TextStyle(fontWeight: FontWeight.bold))),
          onTap: onTap,
        )
      ],
    ),
  );
}
