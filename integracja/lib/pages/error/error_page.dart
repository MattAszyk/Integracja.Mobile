import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:integracja/utils/constrains.dart';

class ErrorPage extends StatelessWidget {
  final String error;
  final bool showImage;
  ErrorPage(this.error, {this.showImage = false});
  @override
  Widget build(BuildContext context) {
    return showImage ? buildWithLogo(context) : buildWithoutLogo(context);
  }

  Widget buildWithLogo(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/login_screen/login_background.jpg"),
          fit: BoxFit.cover,
        )),
        child: AlertDialog(
          backgroundColor: backgroundColor.withOpacity(0.8),
          title: Text('Wystąpił błąd:',
              style: TextStyle(color: primaryLightColor)),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(error, style: TextStyle(color: primaryLightColor)),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'OK',
                style: TextStyle(color: primaryColor),
              ),
              onPressed: () {
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildWithoutLogo(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(automaticallyImplyLeading: false),
      body: Container(
        child: AlertDialog(
          backgroundColor: Color(0xff202239).withOpacity(0.8),
          title: Text('Wystąpił błąd:',
              style: TextStyle(color: primaryLightColor)),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(error, style: TextStyle(color: primaryLightColor)),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'OK',
                style: TextStyle(color: primaryColor),
              ),
              onPressed: () {
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}
