import 'package:cointopper/widget/news_featured.dart';
import 'package:flutter/material.dart';

import 'news_list_screen.dart';
import 'news_search.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  var textInput;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            padding: EdgeInsets.only(top: 30, left: 10, right: 10),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xFFdb1ec9), Color(0xFFff005a)],
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "CoinTopper",
                      style: TextStyle(fontSize: 18, color: Colors.white60),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "News",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => NewsSearch()));
                      },
                      child: Container(
                          padding:
                              EdgeInsets.only(top: 10, bottom: 10, left: 10),
                          height: 40,
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(
                            // color: Color(0xFF00e00),
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            "Search",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          )),
                    ),
                  ],
                )
              ],
            ),
          ),
          NewsFeatured(),
          Expanded(
            child: NewsList(),
          ),
        ],
      ),
    );
  }
}
