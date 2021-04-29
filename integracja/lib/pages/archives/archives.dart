import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:integracja/controllers/archives/archives_controller.dart';
import 'package:integracja/controllers/archives/archives_state.dart';
import 'package:integracja/pages/archives/archived_games.dart';
import 'package:integracja/pages/common/logo.dart';
import 'package:integracja/utils/constrains.dart';

class Archives extends StatefulWidget {
  @override
  _ArchivesState createState() => _ArchivesState();
}

class _ArchivesState extends State<Archives> {
  ArchivesController _archivesController = Get.put(ArchivesController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () => Get.back(),
        ),
        centerTitle: true,
        title: const Text(
          'Historia gier',
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
              if (_archivesController.state is ArchivesLoading) {
                return Logo();
              } else if (_archivesController.state is ArchivesLoaded) {
                return ArchivedGames(
                    (_archivesController.state as ArchivesLoaded).gameUserList);
              } else {
                return Container();
              }
            }),
          ],
        ),
      ),
    );
  }
}
