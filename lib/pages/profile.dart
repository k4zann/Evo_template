import 'package:flutter/material.dart';

import 'drawer.dart';
import 'home.dart';


class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomSheet: buildSheet(),
      key: _scaffoldKey,
      endDrawer: NavBar(),
      bottomNavigationBar: _bottomAppBar(_scaffoldKey, context),
    );
  }
}

BottomAppBar _bottomAppBar(GlobalKey<ScaffoldState> _scaffoldKey, BuildContext context) {
  return BottomAppBar(
    shape: CircularNotchedRectangle(),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
          icon: Image.asset('assets/icons/home.png'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
        ),
        IconButton(
          icon: Image.asset('assets/icons/person.png'),
          onPressed: () {
          },
        ),
        IconButton(
          icon: Image.asset('assets/icons/time.png'),
          onPressed: () {},
        ),
        IconButton(
          icon: Image.asset('assets/icons/hamburg.png'),
          onPressed: () {
            _scaffoldKey.currentState?.openEndDrawer();
          },
        ),
      ],
    ),
  );
}