import 'package:flutter/material.dart';

const ApiUrl = '';
const websiteURL = "https://integracja-web.azurewebsites.net/";
const primaryColor = Color(0xffFFC759); //Color(0xfff4d052)
const primaryLightColor = Color(0xffe9ebec); // Color(0xFFF1E6FF);
const backgroundColor = Color(
    0xff343750); // Color(0xFF3561F1); // Color(0x3561F1); // Color(0xFF202020);

String registrationPage = websiteURL + "Identity/Account/Register";
String forgotPasswordPage = websiteURL + "Identity/Account/ForgotPassword";

const textDefaultSize = 16.0;
const textSmallSize = 14.0;
const textMicroSize = 10.0;
const textBigSize = 22.0;

class Constants {
  static Row favorite = Row(
    children: [
      Icon(Icons.favorite),
      SizedBox(
        width: 20.0,
      ),
      Text('Ilość żyć'),
    ],
  );
  static Row group = Row(
    children: [
      Icon(Icons.group),
      SizedBox(
        width: 20.0,
      ),
      Text('Maksymalna liczba graczy'),
    ],
  );
  static Row hourglass = Row(
    children: [
      Icon(Icons.hourglass_full),
      SizedBox(
        width: 20.0,
      ),
      Text('Czas na jedno pytanie'),
    ],
  );
  static Row watch = Row(
    children: [
      Icon(Icons.watch_later_rounded),
      SizedBox(
        width: 20.0,
      ),
      Text('Czas na cały quiz'),
    ],
  );
  static Row infinity = Row(
    children: [
      Icon(Icons.all_inclusive),
      SizedBox(
        width: 20.0,
      ),
      Text('Nieograniczony'),
    ],
  );

  static List<Row> choices = <Row>[favorite, group, hourglass, watch, infinity];
}
