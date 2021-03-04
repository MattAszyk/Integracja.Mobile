import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:integracja/blocs/authentication/authentication_bloc.dart';
import 'package:integracja/models/game/game.dart';
import 'package:integracja/models/game/game_user.dart';
import 'package:integracja/network/api/game_repository.dart';
import 'package:integracja/pages/game_details/game_details.dart';
import 'game_card.dart';

class ActiveGames extends StatelessWidget {
  Widget build(BuildContext context) {
    Game game;
    return Column(
      children: [
        GestureDetector(
          child: GameCard(game),
          onTap: () => _onGameCardTap(context, "1"),
        ),
        GestureDetector(
          child: GameCard(game),
          onTap: () => _onGameCardTap(context, "1"),
        ),
        GestureDetector(
          child: GameCard(game),
          onTap: () => _onGameCardTap(context, "1"),
        ),
        GestureDetector(
          child: GameCard(game),
          onTap: () => _onGameCardTap(context, "1"),
        ),
        GestureDetector(
          child: GameCard(game),
          onTap: () => _onGameCardTap(context, "1"),
        ),
        GestureDetector(
          child: GameCard(game),
          onTap: () => _onGameCardTap(context, "1"),
        ),
        GestureDetector(
          child: GameCard(game),
          onTap: () => _onGameCardTap(context, "1"),
        ),
      ],
    );
    /*final authBloc = BlocProvider.of<AuthenticationBloc>(context);

    var games = GameRepository(user: user).fetchAll();
    
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: 1 == 1
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
    );*/
  }

  _onGameCardTap(BuildContext context, String gameID) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GameDetails("1")),
    );
  }
}
