import 'package:flutter/material.dart';
import 'dart:async';
import "package:http/http.dart" as http;
import 'dart:convert';

import 'package:updateme/models/post.dart';
import 'package:updateme/widgets/drawerwidget.dart';
import 'package:updateme/widgets/newscard.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post> posts = List();
  bool isLoaded = false;

  String url =
      "http://newsapi.org/v2/top-headlines?apiKey=33b24be8d9404eef8fed1bee30c73f2f&country=in";

  Future<void> _fetchData() async {
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        posts = (data["articles"] as List).map((post) {
          return Post.fromJSON(post);
        }).toList();
        setState(() {
          this.isLoaded = true;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    _fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        title: Text("Update Me", style: TextStyle(fontFamily: 'Baloo', fontWeight: FontWeight.bold, fontSize: 25),),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        child: this.isLoaded
            ? ListView.builder(
                itemCount: posts.length,
                itemBuilder: (BuildContext context, int index) {
                  return NewsCard(posts[index]);
                },
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
        onRefresh: _fetchData,
      ),
    );
  }
}
