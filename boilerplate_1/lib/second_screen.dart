import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SecondScreen extends StatelessWidget {

  final String greetingText;

  SecondScreen(this.greetingText);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: RaisedButton(
            child: Text('Open Google'),
            onPressed: _launchUrl
          )
        ),
      ),
    );
  }
}

_launchUrl() async {
  final String url = "https://www.google.com";
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}