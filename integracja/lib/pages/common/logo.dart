import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:integracja/utils/constrains.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Center(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 0.25 * height, bottom: 0.1 * height),
            child: Text.rich(
              TextSpan(
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40.0,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold),
                  children: <TextSpan>[
                    TextSpan(text: 'inte'),
                    TextSpan(
                        text: 'GRA', style: TextStyle(color: primaryColor)),
                    TextSpan(text: 'cja')
                  ]),
            ),
          ),
          SizedBox(
            width: 60,
            height: 60,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
