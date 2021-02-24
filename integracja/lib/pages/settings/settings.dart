import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 221, 52),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: const Text(
          'Ustawienia',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: SettingsList(
        backgroundColor: Color.fromARGB(255, 30, 30, 30),
        contentPadding: EdgeInsets.only(top: 10),
        sections: [
          SettingsSection(
            title: 'Główne',
            titleTextStyle: TextStyle(
              color: Color.fromARGB(255, 255, 221, 52),
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
              color: Color.fromARGB(255, 255, 221, 52),
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
                onPressed: (BuildContext context) {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
