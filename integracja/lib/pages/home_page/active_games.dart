import 'package:flutter/material.dart';
import 'game_card.dart';

class ActiveGames extends StatelessWidget {
  final games = [];
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: games.isNotEmpty
            ? ListView(
                children: games
                    .map((game) => GestureDetector(
                          child: GameCard(game),
                          onTap: () => _onGameCardTap(context, game.guid),
                        ))
                    .toList(),
              )
            : Container(
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  "assets/images/arrow.png",
                  fit: BoxFit.fill,
                ),
              ),
      ),
    );
  }

  _onGameCardTap(BuildContext context, String gameID) {
    //Navigator.pushNamed(context, GameDetailRoute, arguments: {'id': gameID});
  }
}
