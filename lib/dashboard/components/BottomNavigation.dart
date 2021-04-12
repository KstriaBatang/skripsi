import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class BottomNavigationNavbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      height: 70,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              Icon(Icons.home_outlined, size: 32),
              Text("Home"),
            ],
          ),
          Column(
            children: <Widget>[
              Icon(Icons.person_outline, size: 32),
              Text("Profile"),
            ],
          ),
          Column(
            children: <Widget>[
              Icon(Icons.settings_outlined, size: 32),
              Text("Settings"),
            ],
          ),
        ],
      ),
    );
  }
}
