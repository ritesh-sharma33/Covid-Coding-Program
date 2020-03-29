import 'package:flutter/material.dart';
import 'package:update_me/models/post.dart';
import 'package:update_me/pages/webview.dart';

class NewsCard extends StatefulWidget {
  final Post post;

  NewsCard(this.post);

  @override
  _NewsCardState createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  bool isLiked = false;
  bool isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    return Card(
        elevation: 3,
        child: InkWell(
          onDoubleTap: () {
            setState(() {
              this.isLiked = !this.isLiked;
            });
          },
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        WebView(widget.post.url, widget.post.title)));
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: deviceHeight * 0.3,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(widget.post.image))),
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
                              3.8
                            ])),
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                              top: deviceHeight * 0.125, left: 8.0, right: 8.0),
                          child: Text(
                            widget.post.title,
                            style: TextStyle(
                              height: 1.25,
                              fontSize: deviceHeight * 0.03,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 5.0,
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      widget.post.name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: deviceHeight * 0.029),
                    ),
                  ),
                  Spacer(),
                  widget.post.author != null
                      ? Padding(
                          padding: EdgeInsets.only(bottom: 5.0),
                          child: Chip(
                            backgroundColor: Colors.white,
                            avatar: Icon(Icons.edit),
                            label: Text(widget.post.author),
                          ))
                      : SizedBox()
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0, bottom: 8.0),
                child: Text(widget.post.publishedAt),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  widget.post.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: deviceHeight * 0.02),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IconButton(
                    icon: this.isLiked
                        ? Icon(Icons.favorite)
                        : Icon(Icons.favorite_border),
                    onPressed: () {
                      setState(() {
                        this.isLiked = !this.isLiked;
                      });
                    },
                  ),
                  IconButton(
                    icon: this.isBookmarked ? Icon(Icons.bookmark) : Icon(Icons.bookmark_border),
                    onPressed: () {
                      setState(() {
                        this.isBookmarked = !this.isBookmarked;
                      });
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.share),
                    onPressed: () {},
                  )
                ],
              )
            ],
          ),
        ));
  }
}
