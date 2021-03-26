import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:integracja/pages/home_page/home_page.dart';
import 'package:integracja/pages/settings/settings.dart';
import 'package:integracja/utils/constrains.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: primaryColor,
      shape: CircularNotchedRectangle(),
      notchMargin: 10,
      child: Row(
        children: [
          Spacer(),
          IconButton(
              icon: Icon(Icons.person_outline_outlined),
              onPressed: () {
                Get.to(() => Settings());
              }),
          Spacer(),
          Spacer(),
          Spacer(),
          IconButton(
              icon: Icon(Icons.history),
              onPressed: () {
                Get.offAll(HomePage());
              }),
          Spacer(),
        ],
      ),
    );
  }
}
