import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:integracja/blocs/authentication/authentication_bloc.dart';
import 'package:integracja/models/authentication/user.dart';
import 'package:integracja/pages/qr_scan/qr_scan.dart';
import 'package:integracja/utils/constrains.dart';
import 'active_games.dart';
import 'bottom_nav_bar.dart';

class HomePage extends StatelessWidget {
  final User user;

  const HomePage({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthenticationBloc>(context);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Moje gry',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ActiveGames(),
              SizedBox(
                height: 12,
              ),
              Center(
                child: FlatButton(
                  textColor: primaryColor,
                  child: Text('Logout'),
                  onPressed: () {
                    authBloc.add(UserLoggedOut());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
      floatingActionButton: FloatingActionButton(
          backgroundColor: primaryColor,
          child: Icon(
            Icons.play_arrow,
            size: 35,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => QRScan()),
            );
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
