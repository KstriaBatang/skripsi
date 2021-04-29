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
              Icon(Icons.home_outlined, size: 27),
              Text("Home", style: TextStyle(fontSize: 12)),
            ],
          ),
          Column(
            children: <Widget>[
              Icon(Icons.person_outline, size: 27),
              Text("Profile", style: TextStyle(fontSize: 12)),
            ],
          ),
          Column(
            children: <Widget>[
              Icon(Icons.settings_outlined, size: 27),
              Text("Settings", style: TextStyle(fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }
}
