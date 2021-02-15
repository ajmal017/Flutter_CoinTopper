import 'package:cointopper/bloc/search_coin_bloc/searchCoinList_state.dart';
import 'package:cointopper/bloc/search_coin_bloc/search_coin_list_bloc.dart';
import 'package:cointopper/models/search_coin_response_model.dart';
import 'package:cointopper/screens/coin_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<SearchCoinListResponseModel> _searchResult = [];

class SearchScreen extends StatefulWidget {
  final String currencyCode;
  final dynamic currencySymbol;

  SearchScreen(
    this.currencyCode,
    this.currencySymbol,
  );

  @override
  _SearchScreenState createState() => new _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController controller = new TextEditingController();

  onSearchTextChanged(String text, dynamic data) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }
    data.forEach(
      (coin) {
        if (coin.value.toLowerCase().contains(text.toLowerCase()))
          _searchResult.add(coin);
      },
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: BlocBuilder<SearchCoinListBloc, SearchCoinListState>(
        builder: (context, state) {
          if (state is SearchCoinListLoadSuccess) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 90,
                  padding: EdgeInsets.only(top: 32, left: 10, right: 10),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Colors.blue[800], Colors.blue[400]],
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
//                      height: MediaQuery.of(context).size.height * 0.06,
                            height: 40,
                            width: MediaQuery.of(context).size.width * 0.8,
                            decoration: BoxDecoration(
                              color: Color(0xFF00e00),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: TextField(
                              cursorColor: Colors.white60,
                              autofocus: true,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                              controller: controller,
                              decoration: new InputDecoration(
                                contentPadding: EdgeInsets.all(8.0),
                                hintText: "Search",
                                hintStyle: TextStyle(
                                  color: Colors.white60,
                                  fontSize: 16,
                                ),
                                suffix: GestureDetector(
                                  onTap: () {
                                    controller.clear();
                                    onSearchTextChanged(
                                        '', state.searchCoinList);
                                  },
                                  child: Text(
                                    'Clear',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              onChanged: (String text) async {
                                _searchResult.clear();
                                if (text.isEmpty) {
                                  setState(() {});
                                  return;
                                }

                                state.searchCoinList.forEach(
                                  (coin) {
                                    if (coin.value
                                        .toLowerCase()
                                        .contains(text.toLowerCase()))
                                      _searchResult.add(coin);
                                  },
                                );

                                setState(() {});
                              },
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(56),
                                color: Colors.white30,
                              ),
                              child: Icon(
                                Icons.close,
                                color: Colors.white60,
                                size: 24.0,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                new Expanded(
                  child: _searchResult.length != 0 && controller.text.isNotEmpty
                      ? new ListView.builder(
                          itemCount: _searchResult.length,
                          itemBuilder: (context, i) {
                            return Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (_) => CoinDetail(
                                                _searchResult[i].id,
                                                widget.currencyCode,
                                                widget.currencySymbol)));
                                  },
                                  child: new ListTile(
                                    leading: new CircleAvatar(
                                      backgroundImage: new NetworkImage(
                                        _searchResult[i].logo,
                                      ),
                                    ),
                                    title: new Text(_searchResult[i].value),
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
              ],
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
