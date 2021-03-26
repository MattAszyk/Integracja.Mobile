import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:integracja/controllers/authentication/authentication_controller.dart';
import 'package:integracja/models/game/detail_game_user.dart';
import 'package:integracja/models/game/game_user.dart';
import 'package:integracja/pages/play/play.dart';

class GameDetailsAppBar extends StatelessWidget {
  final DetailGameUser _detailGameUser;
  GameDetailsAppBar(this._detailGameUser);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        onPressed: () => Get.back(),
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.logout,
            color: Colors.black,
          ),
          onPressed: () => Get.back(),
        ),
      ],
      centerTitle: true,
      floating: true,
      pinned: true,
      expandedHeight: 180,
      title: Text(_detailGameUser.game.name),
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        background: Container(
          child: Container(
            margin: EdgeInsets.only(
              top: 100,
            ),
            child: Center(
              child: Column(
                children: [
                  OutlinedButton(
                    onPressed: () {
                      Get.off(() => Play(_detailGameUser));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        'GRAJ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "czas",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
