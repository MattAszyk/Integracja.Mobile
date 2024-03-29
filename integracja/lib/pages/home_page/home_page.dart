import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:integracja/controllers/home_page/home_page_controller.dart';
import 'package:integracja/controllers/home_page/home_page_state.dart';
import 'package:integracja/pages/common/logo.dart';

import 'package:integracja/pages/qr_scanner/qr_scanner.dart';

import 'package:integracja/utils/constrains.dart';
import 'active_games.dart';
import 'bottom_nav_bar.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _homePageController = Get.put(HomePageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Moje gry',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: <Widget>[
          PopupMenuButton<String>(
            offset: Offset(0, 40),
            icon: Icon(
              Icons.help_outline,
              size: 30,
            ),
            itemBuilder: (BuildContext context) {
              return Constants.choices.map((Row choice) {
                return PopupMenuItem<String>(
                  enabled: false,
                  child: choice,
                );
              }).toList();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Obx(() {
              if (_homePageController.state is HomePageLoading) {
                return Logo();
              } else if (_homePageController.state is HomePageLoaded) {
                return ActiveGames(
                    (_homePageController.state as HomePageLoaded).gameUserList);
              } else {
                return Container();
              }
            }),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
      floatingActionButton: FloatingActionButton(
          backgroundColor: primaryColor,
          child: Icon(
            Icons.qr_code_scanner,
            size: 35,
            color: Colors.black,
          ),
          onPressed: () => Get.to(() => QrScanner())),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
