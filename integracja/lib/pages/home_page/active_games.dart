import 'package:flutter/material.dart';
import 'package:integracja/models/game/game_user.dart';
import 'game_card.dart';

class ActiveGames extends StatelessWidget {
  final List<GameUser> _gameUserList;
  ActiveGames(this._gameUserList);
  Widget build(BuildContext context) {
    return Container(
        child: Container(
      child: !_gameUserList.isEmpty
          ? ListView.separated(
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return GameCard(_gameUserList[index].game);
              },
              separatorBuilder: (_, index) => const Divider(),
              itemCount: _gameUserList.length)
          : Container(
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                "assets/images/arrow.png",
                fit: BoxFit.fill,
              ),
            ),
    ));
  }

  _onGameCardTap(BuildContext context, String gameID) {
    //Navigator.pushNamed(context, GameDetailRoute, arguments: {'id': gameID});
  }
}
