import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:integracja/controllers/home_page/home_page_controller.dart';
import 'package:integracja/models/game/game_user.dart';
import 'package:integracja/pages/common/game_card.dart';
import 'package:integracja/pages/game_details/game_details.dart';
import 'package:integracja/utils/constrains.dart';

class ActiveGames extends StatelessWidget {
  final List<GameUser> _gameUserList;
  ActiveGames(this._gameUserList);
  Widget build(BuildContext context) {
    _gameUserList.sort((a, b) => a.game.startTime.compareTo(b.game.startTime));
    return Expanded(
      child: RefreshIndicator(
        child: Container(
          child: _gameUserList.isNotEmpty
              ? ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      child: GameCard(_gameUserList[index].game, false),
                      onTap: () =>
                          _onGameCardTap(context, _gameUserList[index].game.id),
                    );
                  },
                  separatorBuilder: (_, index) => const SizedBox(
                        height: 5,
                      ),
                  itemCount: _gameUserList.length)
              : GestureDetector(
                  onTap: () => Get.find<HomePageController>().refresh(),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      'assets/images/arrow.png',
                      fit: BoxFit.fill,
                    ),
                  )),
        ),
        onRefresh: () => Get.find<HomePageController>().refresh(),
      ),
    );
  }

  _onGameCardTap(BuildContext context, int gameId) {
    Get.to(() => GameDetails(gameId, false));
  }
}
