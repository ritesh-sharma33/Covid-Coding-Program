import 'package:flutter/material.dart';
import 'package:updateme/models/post.dart';
import 'package:updateme/pages/webview.dart';

class NewsCard extends StatefulWidget {
  final Post post;

  NewsCard(this.post);

  @override
  _NewsCardState createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    return Card(
      elevation: 3,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (context) => WebView(widget.post.url, widget.post.title)
            )
          );
        },
        child: Column(
          children: <Widget>[
            widget.post.image != null
                ? Stack(
                    children: <Widget>[
                      Container(
                        height: deviceHeight * 0.3,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            image: DecorationImage(
                                image: NetworkImage(widget.post.image),
                                fit: BoxFit.fill)),
                      ),
                      Container(
                        height: deviceHeight * 0.3,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            gradient: LinearGradient(
                                begin: FractionalOffset.bottomCenter,
                                end: FractionalOffset.center,
                                colors: [
                                  Colors.black.withOpacity(0.55),
                                  Colors.black.withOpacity(0.15)
                                ],
                                stops: [
                                  0.5,
                                  3
                                ])),
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: deviceHeight * 0.125, left: 8.0, right: 8.0),
                          child: Text(
                            widget.post.title,
                            style: TextStyle(
                                height: 1.25,
                                fontSize: deviceHeight * 0.03,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontFamily: "Baloo"),
                          ),
                        ),
                      ),
                    ],
                  )
                : Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      widget.post.title,
                      style: TextStyle(
                          height: 1.25,
                          fontSize: deviceHeight * 0.03,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
            SizedBox(height: 5.0,),
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    widget.post.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: deviceHeight * 0.029,
                      color: Colors.blue[400]
                    ),
                  ),
                ),
                Spacer(),
                widget.post.author != null
                ?
                Padding(
                  padding: EdgeInsets.only(bottom: 5.0),
                  child: Chip(
                    backgroundColor: Colors.white,
                    avatar: Icon(Icons.edit, color: Colors.blue[800],),
                    label: Text(widget.post.author, style: TextStyle(color: Colors.blue[400]),),
                  ),
                )
                : SizedBox()
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, bottom: 8.0),
              child: Text(widget.post.publishedAt),
            ),
            widget.post.description != null
            ?
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                widget.post.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: deviceHeight * 0.02),
              ),
            ) : SizedBox(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.favorite_border),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.bookmark_border),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.share),
                  onPressed: () {},
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
