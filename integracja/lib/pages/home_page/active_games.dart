import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:integracja/models/game/game_user.dart';
import 'package:integracja/pages/game_details/game_details.dart';
import 'game_card.dart';

class ActiveGames extends StatelessWidget {
  final List<GameUser> _gameUserList;
  ActiveGames(this._gameUserList);
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: _gameUserList.isNotEmpty
            ? ListView.separated(
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    child: GameCard(_gameUserList[index].game),
                    onTap: () =>
                        _onGameCardTap(context, _gameUserList[index].game.id),
                  );
                },
                separatorBuilder: (_, index) => const SizedBox(
                      height: 5,
                    ),
                itemCount: _gameUserList.length)
            : Container(
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  'assets/images/arrow.png',
                  fit: BoxFit.fill,
                ),
              ),
      ),
    );
  }

  _onGameCardTap(BuildContext context, int gameId) {
    Get.to(() => GameDetails(gameId));
  }
}
