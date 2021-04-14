import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:integracja/controllers/authentication/authentication_controller.dart';
import 'package:integracja/utils/constrains.dart';
import 'package:settings_ui/settings_ui.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () => Get.back()),
        centerTitle: true,
        title: const Text(
          'Ustawienia',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: SettingsList(
        backgroundColor: backgroundColor,
        contentPadding: EdgeInsets.only(top: 10),
        sections: [
          SettingsSection(
            title: 'Główne',
            titleTextStyle: TextStyle(
              color: primaryColor,
            ),
            tiles: [
              SettingsTile(
                title: 'Język',
                titleTextStyle: TextStyle(
                  color: Colors.white,
                ),
                subtitle: 'English',
                subtitleTextStyle: TextStyle(
                  color: Colors.white,
                ),
                leading: Icon(
                  Icons.language,
                  color: Colors.white,
                ),
                onPressed: (BuildContext context) {},
              ),
              SettingsTile(
                title: 'Coś',
                titleTextStyle: TextStyle(
                  color: Colors.white,
                ),
                leading: Icon(
                  Icons.local_airport,
                  color: Colors.white,
                ),
                onPressed: (BuildContext context) {},
              ),
            ],
          ),
          SettingsSection(
            title: 'Konto',
            titleTextStyle: TextStyle(
              color: primaryColor,
            ),
            tiles: [
              SettingsTile(
                title: 'Zmień email',
                titleTextStyle: TextStyle(
                  color: Colors.white,
                ),
                leading: Icon(
                  Icons.mail,
                  color: Colors.white,
                ),
                onPressed: (BuildContext context) {},
              ),
              SettingsTile(
                title: 'Zmień hasło',
                titleTextStyle: TextStyle(
                  color: Colors.white,
                ),
                leading: Icon(
                  Icons.lock,
                  color: Colors.white,
                ),
                onPressed: (BuildContext context) {},
              ),
              SettingsTile(
                title: 'Wyloguj',
                titleTextStyle: TextStyle(
                  color: Colors.white,
                ),
                leading: Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                onPressed: (BuildContext context) {
                  final AuthenticationController authenticationController =
                      Get.find();
                  authenticationController.signOut();
                  Get.back();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
