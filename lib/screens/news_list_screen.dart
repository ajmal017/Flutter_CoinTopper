import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cointopper/bloc/news_list_bloc/news_list_bloc.dart';
import 'package:cointopper/bloc/news_list_bloc/news_list_state.dart';
import 'package:cointopper/screens/news_webview_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

class NewsList extends StatefulWidget {
  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  bool isVisible = false;
  var cid;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsListBloc, NewsListState>(
      builder: (context, state) {
        if (state is NewsListLoadSuccess) {
          final data = state.newsList;
          return Column(children: [
            Container(
              padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
              width: MediaQuery.of(context).size.width * 1,
              child: Text(
                "RECENT NEWS",
                style: TextStyle(
                  color: HexColor("#005580"),
                  fontSize: MediaQuery.of(context).size.width * 0.03,
                ),
              ),
            ),
            new Expanded(
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
                                visualDensity:
                                    VisualDensity(horizontal: -4, vertical: 0),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                            shape: new RoundedRectangleBorder(
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        50.0)),
                                            child: Icon(
                                              isVisible && cid == data[i].id
                                                  ? FontAwesomeIcons.chevronUp
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
            ),
          ]);
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
