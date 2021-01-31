import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cointopper/bloc/news_details_bloc/news_details_bloc.dart';
import 'package:cointopper/bloc/news_details_bloc/news_details_event.dart';
import 'package:cointopper/bloc/news_details_bloc/news_details_state.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class NewsWebview extends StatefulWidget {
  final int id;

  NewsWebview({
    @required this.id,
  });

  @override
  _NewsWebviewState createState() => _NewsWebviewState(id: id);
}

class _NewsWebviewState extends State<NewsWebview> {
  final int id;
  _NewsWebviewState({
    @required this.id,
  });

  final globalKey = GlobalKey<ScaffoldState>(); 
  @override
  void initState() {
    super.initState();
    BlocProvider.of<NewsDetailsBloc>(context).add(LoadNewsDetails(id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      body: BlocBuilder<NewsDetailsBloc, NewsDetailsState>(
        builder: (context, state) {
          
          if (state is NewsDetailsLoadSuccess) {
            var data = state.newsDetailsList;
            var details = data.map((e) => e.detailsEn).toList();
            var title = data.map((e) => e.titleEn).toList();
            var photo = data.map((e) => e.photoFile.trim()).toList();
            print("details==>$details");
            // return _buildWebView(details.single);
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 80,
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
                        children: [
                          Text(
                            "News",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white60,
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
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [Color(0xFFdb1ec9), Color(0xFFff005a)],
                          ),
                        ),
                        child: Text(
                          title.single.toString(),
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        child: Image(
                          width: MediaQuery.of(context).size.width,
                          height: 160,
                          fit: BoxFit.fill,
                          image: NetworkImage(photo.single.toString()),
                        ),
                      ),
                      Expanded(
                        // child: _buildWebView(details.single.toString()),
                        child: WebviewScaffold(
                          url: new Uri.dataFromString(details.single,
                                  mimeType: 'text/html')
                              .toString(),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      // body: _buildWebView(data),
    );
  } }