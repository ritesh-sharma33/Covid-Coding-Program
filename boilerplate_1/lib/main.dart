import 'package:boilerplate_1/second_screen.dart';
import 'package:flutter/material.dart';
import 'replacement.dart';
import 'user_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Boilerplate App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'Boilerplate App'),
      routes: {
        '/second': (context) => SecondScreen("Hello")
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  _buildCustomCard() {
    return Card(
      child: Column(
        children: <Widget>[
          Icon(
            Icons.phone_iphone,
            color: Colors.black,
            size: 100,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'This is a dummy iPhone',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text('Boilerplate App'),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(25),
        child: ListView(
          children: <Widget>[
            Text(
              'Hello and welcome here, good morning...',
              style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            _buildCustomCard(),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              color: Colors.red,
              child: Text('Click here to see the magic'),
              onPressed: () {
                // Navigator.push(
                //   context, 
                //   MaterialPageRoute(
                //     builder: (context) => SecondScreen("Hello there, welcome")
                //   )
                // );

                // Navigator.pushNamed(context, '/second');

                // Navigator.pushReplacementNamed(context, '/second');

                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) => UserList()
                  )
                );
              },
            ),
            SizedBox(
              height: 20,
            ),
            Image.asset(
              'assets/images/programming.jpg',
              height: deviceHeight * 0.5,
            ),
            Image.asset(
              'assets/images/programming.jpg',
              height: 250,
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/programming.jpg')
                )
              ),
              child: Text('Hello John'),
            ),
            Text('Hi, John', style: TextStyle(
              fontWeight: FontWeight.bold
            ),)
          ],
        ),
      ),
    );
  }
}
