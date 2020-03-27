import 'package:flutter/material.dart';

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
              'Hello and welcome here...',
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
                print('Magic button clicked');
              },
            ),
            SizedBox(
              height: 20,
            ),
            Image.asset(
              'assets/images/programming.jpg',
              height: 250,
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
