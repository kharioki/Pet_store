import 'package:flutter/material.dart';
import 'package:pet_store/configuration.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryGreen,
      padding: EdgeInsets.only(top: 50, left: 20, bottom: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.white,
              ),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Mr Tony Stark',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Active now',
                    style: TextStyle(
                      color: Colors.grey[200],
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: drawerItems
                .map((element) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            element['icon'],
                            color: Colors.grey[200],
                            size: 30,
                          ),
                          SizedBox(width: 20),
                          Text(
                            element['title'],
                            style: TextStyle(
                              color: Colors.grey[200],
                              fontSize: 20,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                        ],
                      ),
                    ))
                .toList(),
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.settings,
                color: Colors.white,
              ),
              SizedBox(width: 16),
              Text(
                'Settings',
                style: TextStyle(
                  color: Colors.grey[200],
                  fontSize: 18,
                  fontWeight: FontWeight.w200,
                ),
              ),
              SizedBox(width: 16),
              Container(
                width: 2,
                height: 20,
                color: Colors.grey[200],
              ),
              SizedBox(width: 16),
              Text(
                'Log out',
                style: TextStyle(
                  color: Colors.grey[200],
                  fontSize: 18,
                  fontWeight: FontWeight.w200,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
