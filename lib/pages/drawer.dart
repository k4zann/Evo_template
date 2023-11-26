import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.close),
                )
              ),
            ],
          ),
          UserAccountsDrawerHeader(
            accountName: Text(
                'Arshat Arshat',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            accountEmail: Text(
              '',
            ),
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _drawerButton('Подписка EVO Prime'),
              Text(
                  'Следующее списание: 25.10.2023 ',
                  style: TextStyle(
                    color: Color(0xff716D6D),
                    fontSize: 11,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              _drawerButton('История заказов')
            ],
          ),
          _divider(),
          Column(
            children: [
              _drawerButton('Profile'),
              _drawerButton('Choose tarif'),
              _drawerButton('Promo-code'),
              _drawerButton('Sales%')
            ],
          ),
          _divider(),
          Column(
            children: [
              _drawerButton('Служба поддержки'),
              _drawerButton('Settings'),
              _drawerButton('Information')
            ],
          )
        ],
      ),
    );
  }
}

TextButton _drawerButton(String name) {
  return TextButton(
    onPressed: () {

    },
    child: Text(
      name,
      style: TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}

Container _divider() {
  return Container(
    width: 100,
    height: 0,
    decoration: BoxDecoration(
      border: Border.all(color: Color(0xffA8A8A8)),
    ),
  );
}