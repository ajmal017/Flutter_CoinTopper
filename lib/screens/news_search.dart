import 'package:flutter/material.dart';
import 'package:cointopper/bloc/news_search_bloc/news_search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cointopper/bloc/news_search_bloc/news_search_bloc.dart';
import 'package:cointopper/bloc/news_search_bloc/news_search_event.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'news_webview_screen.dart';

class NewsSearch extends StatefulWidget {
  @override
  _NewsSearchState createState() => new _NewsSearchState();
}

class _NewsSearchState extends State<NewsSearch> {
  TextEditingController controller = new TextEditingController();

  var _searchResult = [];
  bool isVisible = false;
  var cid;
  onSearchTextChanged(String text) async {
    BlocProvider.of<NewsSearchBloc>(context).add(LoadNewsSearch(text));
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 90,
            padding: EdgeInsets.only(top: 30, left: 10, right: 10, bottom: 0),
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
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        leading: new Icon(
                          Icons.search,
                          color: Colors.white60,
                        ),
                        title: new TextField(
                          cursorColor: Colors.white60,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                          controller: controller,
                          decoration: new InputDecoration(
                              hintText: "Search",
                              hintStyle: TextStyle(color: Colors.white60),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(12))),
                          onChanged: onSearchTextChanged,
                        ),
                        trailing: new IconButton(
                          icon: new Icon(
                            Icons.cancel,
                            color: Colors.white60,
                          ),
                          onPressed: () {
                            controller.clear();
                            onSearchTextChanged('');
                          },
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white30,
                        ),
                        child: Icon(
                          Icons.close,
                          color: Colors.white60,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          BlocBuilder<NewsSearchBloc, NewsSearchState>(
            builder: (context, state) {
              if (state is NewsSearchLoadSuccess) {
                final data = state.newsSearchList;
                return new Expanded(
                  child: data.length != 0
                      ? new ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (context, i) {
                            return Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    // Navigator.of(context).push(MaterialPageRoute(
                                    //     builder: (_) =>
                                    //         CoinDetails(_searchResult[i].id)));
                                  },
                                  child: new ListTile(
                                    dense: true,
                                    visualDensity: VisualDensity(
                                        horizontal: -4, vertical: 0),
                                    contentPadding: EdgeInsets.only(
                                      left: 5.0,
                                      right: 15.0,
                                    ),
                                    leading: new Image(
                                      width: 80,
                                      height: 80,
                                      image: NetworkImage(data[i].photoFile),
                                    ),
                                    title: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 0.0, bottom: 0.0),
                                      child: new Text(data[i].titleEn),
                                    ),
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              NewsWebview(
                                            id: data[i].id,
                                          ),
                                        ),
                                      );
                                    },
                                    subtitle: new Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        new Row(
                                          children: [
                                            Flexible(
                                              child: Text(
                                                isVisible && cid == data[i].id
                                                    ? data[i].seoDescriptionEn
                                                    : "",
                                                overflow: TextOverflow.visible,
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            new Text(data[i].date.toString()),
                                            new Text("Share"),
                                            new FlatButton(
                                                minWidth: 2,
                                                shape:
                                                    new RoundedRectangleBorder(
                                                        borderRadius:
                                                            new BorderRadius
                                                                    .circular(
                                                                50.0)),
                                                child: Icon(
                                                  isVisible && cid == data[i].id
                                                      ? FontAwesomeIcons
                                                          .chevronUp
                                                      : FontAwesomeIcons
                                                          .chevronDown,
                                                  color: Colors.black,
                                                  size: 14,
                                                ),
                                                onPressed: () {
                                                  setState(() {
                                                    isVisible = !isVisible;
                                                    cid = data[i].id;
                                                  });
                                                }),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Divider(
                                  color: Colors.grey[400],
                                  thickness: 1,
                                )
                              ],
                            );
                          },
                        )
                      : Center(
                          child: Text("Please search the Keyword"),
                        ),
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ],
      ),
    );
  }
}
