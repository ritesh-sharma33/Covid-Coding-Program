import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/beach.jpg'),
              ),
            ),
            child: Stack(
              children: <Widget>[
                Positioned(
                  left: 15.0,
                  bottom: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Container(
                        width: 70.0,
                        height: 70.0,
                        decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                                fit: BoxFit.fill,
                                image:
                                    AssetImage("assets/images/profile.png"))),
                      ),
                      new SizedBox(height: 5.0),
                      new Text(
                        "John Doe",
                        style: TextStyle(
                            fontFamily: 'Baloo',
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white,
                            height: 1.4
                        ),
                      ),
                      new Text(
                        "johndoe@gmail.com",
                        style: TextStyle(
                          fontFamily: 'Baloo',
                          height: 1,
                          fontSize: 14,
                          color: Colors.white
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 10.0,),
          
          ListTile(
            leading: Icon(
              Icons.perm_identity,
              color: Colors.blueAccent,
            ),
            title: Text(
              "My profile",
              style: TextStyle(
                fontFamily: 'Baloo',
                fontWeight: FontWeight.bold,
                fontSize: 18
              ),
            ),
          ),
          SizedBox(height: 5.0,),
          ListTile(
            leading: Icon(
              Icons.bookmark,
              color: Colors.blueAccent,
            ),
            title: Text(
              "Saved News",
              style: TextStyle(
                fontFamily: 'Baloo',
                fontWeight: FontWeight.bold,
                fontSize: 18
              ),
            ),
          ),
          SizedBox(height: 5.0,),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: Colors.blueAccent,
            ),
            title: Text(
              "Settings",
              style: TextStyle(
                fontFamily: 'Baloo',
                fontWeight: FontWeight.bold,
                fontSize: 18
              ),
            ),
          ),
          SizedBox(height: 5.0,),
          ListTile(
            leading: Icon(
              Icons.info_outline,
              color: Colors.blueAccent,
            ),
            title: Text(
              "Activities",
              style: TextStyle(
                fontFamily: 'Baloo',
                fontWeight: FontWeight.bold,
                fontSize: 18
              ),
            ),
          ),
          SizedBox(height: 5.0,),
          ListTile(
            leading: Icon(
              Icons.help_outline,
              color: Colors.blueAccent,
            ),
            title: Text(
              "Help Centre",
              style: TextStyle(
                fontFamily: 'Baloo',
                fontWeight: FontWeight.bold,
                fontSize: 18
              ),
            ),
          ),
          SizedBox(height: 5.0,),
          ListTile(
            leading: Icon(
              Icons.contacts,
              color: Colors.blueAccent,
            ),
            title: Text(
              "Contact Us",
              style: TextStyle(
                fontFamily: 'Baloo',
                fontWeight: FontWeight.bold,
                fontSize: 18
              ),
            ),
          ),
          SizedBox(height: 5.0,),
          ListTile(
            leading: Icon(
              Icons.info,
              color: Colors.blueAccent,
            ),
            title: Text(
              "About Us",
              style: TextStyle(
                fontFamily: 'Baloo',
                fontWeight: FontWeight.bold,
                fontSize: 18
              ),
            ),
          ),
          SizedBox(height: 5.0,),
        ],
      ),
    );
  }
}
