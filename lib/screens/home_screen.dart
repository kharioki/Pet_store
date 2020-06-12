import 'package:flutter/material.dart';
import 'package:pet_store/configuration.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;

  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor),
      duration: Duration(milliseconds: 250),
      color: Colors.grey[200],
      child: Column(
        children: <Widget>[
          SizedBox(height: 50),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                !isDrawerOpen
                    ? IconButton(
                        icon: Icon(Icons.menu),
                        onPressed: () {
                          setState(() {
                            xOffset = 230;
                            yOffset = 150;
                            scaleFactor = 0.6;
                            isDrawerOpen = true;
                          });
                        },
                      )
                    : IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          setState(() {
                            xOffset = 0;
                            yOffset = 0;
                            scaleFactor = 1;
                            isDrawerOpen = false;
                          });
                        },
                      ),
                Column(
                  children: <Widget>[
                    Text('Location'),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.location_on,
                          color: primaryGreen,
                        ),
                        SizedBox(width: 5),
                        Text('Westlands'),
                      ],
                    ),
                  ],
                ),
                CircleAvatar(),
              ],
            ),
          ),

          // search bar
          Container(
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(Icons.search),
                Text('Search pet to adopt'),
                Icon(Icons.settings),
              ],
            ),
          ),

          // pet list
          Container(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) => Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(left: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: shadowList,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset(
                        categories[index]['iconPath'],
                        height: 50,
                        width: 50,
                        color: Colors.grey[700],
                      ),
                    ),
                    Text(categories[index]['name']),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
