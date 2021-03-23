import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:integracja/controllers/game_details/game_details_controller.dart';
import 'package:integracja/models/game/detail_game_user.dart';

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
          onPressed: () => Get.find<GameDetailsController>().leaveGameStatus++,
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
                  OutlineButton(
                      color: Colors.red,
                      onPressed: () => Navigator.of(context).pop(),
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
                      borderSide: BorderSide(
                        color: Colors.black, //Color of the border
                        style: BorderStyle.solid, //Style of the border
                        width: 1, //width of the border
                      ),
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0))),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Tu czas ogółem",
                    style: TextStyle(
                      fontSize: 18,
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
