import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:integracja/pages/game_details/game_details.dart';
import 'package:integracja/pages/play/play.dart';
import 'package:integracja/pages/settings/settings.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 10,
      child: Row(
        children: [
          Spacer(),
          IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Get.to(() => Settings());
              }),
          Spacer(),
          Spacer(),
          Spacer(),
          IconButton(
              icon: Icon(Icons.history),
              onPressed: () {
                Get.to(() => Play());
              }),
          Spacer(),
        ],
      ),
    );
  }
}
