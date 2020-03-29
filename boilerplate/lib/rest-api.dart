import 'dart:async';

import 'dart:convert';
import 'package:boilerplate/models/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RestApi extends StatefulWidget {
  @override
  _RestApiState createState() => _RestApiState();
}

class _RestApiState extends State<RestApi> {
  List<User> users = List();

  @override
  void initState() {
    _fetchData();
    super.initState();
  }

  String url = "https://reqres.in/api/users";
  bool isLoaded = false;

  Future<void> _fetchData() async {
    try {
      final response = await http.get(this.url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        // users = (json.decode(response.body) as List).map((data) {
        //   return User.fromJSON(data);
        // }).toList();

        users = (data["data"] as List).map((data) {
          return User.fromJSON(data);
        }).toList();
        print(users[0].email);
        setState(() {
          isLoaded = true;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rest API demo'),
      ),
      body: isLoaded == true
          ? ListView.builder(
              itemCount: users.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: <Widget>[
                    Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height: 250,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(users[index].avatar))),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10.0),
                                          child: Text(
                                            "Name: " +
                                                users[index].firstName +
                                                " " +
                                                users[index].lastName,
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10.0),
                                          child: Text(
                                              "Email: " + users[index].email),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Icon(Icons.add, size: 30,),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                    Divider()
                  ],
                );
              },
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
