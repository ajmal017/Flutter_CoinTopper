import 'dart:convert';

import 'package:cointopper/entities/coin_list_entity.dart';
import 'package:cointopper/models/coin_list_response_model.dart';
import 'package:cointopper/screens/coin_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/intl.dart';

Stream<List<CoinListResponseModel>> fetchCoinList(
    String currencyCode, int offset, int limit) async* {
  final response = await http.get(
      Uri.encodeFull(
          '${"https://api.cointopper.com/api/v3/" + "ticker?offset=$offset&limit=$limit&currency=$currencyCode"}'),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      });
  Map<String, dynamic> map = json.decode(response.body);
  List<dynamic> results = map["data"];
  yield results
      .map((dynamic item) => CoinListResponseModel.fromEntity(
          CoinListEntity.fromJson(item as Map<String, dynamic>)))
      .toList();
}

class CoinListWidget extends StatefulWidget {
  final String currencyCode;
  final dynamic currencySymbol;

  CoinListWidget(
    this.currencyCode,
    this.currencySymbol,
  );

  @override
  _CoinListWidgetState createState() => _CoinListWidgetState();
}

class _CoinListWidgetState extends State<CoinListWidget> {
  bool isSort = true;
  bool isSortChange = true;
  bool isSortPrice = true;
  String code = 'USD';

  int page = -10;
  ScrollController controller;

  static const _pageSize = 20;

  final PagingController<int, CoinListResponseModel> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey, widget.currencyCode);
    });
    super.initState();
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  Future<void> _fetchPage(int pageKey, String code) async {
    try {
      final newItems = await fetchCoinList(code, pageKey, _pageSize).single;
      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + newItems.length;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  dynamic refreshControl() {
    if (widget.currencyCode != code) {
      code = widget.currencyCode;
      _pagingController.refresh();
    }
  }

  @override
  Widget build(BuildContext context) {
    refreshControl();
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          primary: false,
          backgroundColor: Colors.white,
          elevation: 3,
          toolbarHeight: 40,
          title: Container(
            padding: EdgeInsets.symmetric(horizontal: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (isSort) {
                        _pagingController.itemList
                            .sort((a, b) => b.name.compareTo(a.name));
                        isSort = false;
                      } else {
                        _pagingController.itemList
                            .sort((a, b) => a.name.compareTo(b.name));
                        isSort = true;
                      }
                    });
                  },
                  child: Row(
                    children: [
                      Text(
                        'NAME/  M.CAP',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.03,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF005580),
                        ),
                      ),
                      Icon(
                        isSort ? Icons.arrow_downward : Icons.arrow_upward,
                        size: MediaQuery.of(context).size.width * 0.03,
                        color: Color(0xFF005580),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (isSortChange) {
                        _pagingController.itemList
                            .sort((a, b) => b.name.compareTo(a.name));
                        isSortChange = false;
                      } else {
                        _pagingController.itemList
                            .sort((a, b) => a.name.compareTo(b.name));
                        isSortChange = true;
                      }
                    });
                  },
                  child: Row(
                    children: [
                      Text(
                        'CHANGE',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.03,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF005580),
                        ),
                      ),
                      Icon(
                        isSortChange
                            ? Icons.arrow_downward
                            : Icons.arrow_upward,
                        size: MediaQuery.of(context).size.width * 0.03,
                        color: Color(0xFF005580),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (isSortPrice) {
                        _pagingController.itemList
                            .sort((a, b) => b.price.compareTo(a.price));
                        isSortPrice = false;
                      } else {
                        _pagingController.itemList
                            .sort((a, b) => a.price.compareTo(b.price));
                        isSortPrice = true;
                      }
                    });
                  },
                  child: Row(
                    children: [
                      Text(
                        'PRICE',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.03,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF005580),
                        ),
                      ),
                      Icon(
                        isSortPrice ? Icons.arrow_downward : Icons.arrow_upward,
                        size: MediaQuery.of(context).size.width * 0.03,
                        color: Color(0xFF005580),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        PagedSliverList<int, CoinListResponseModel>.separated(
          pagingController: _pagingController,
          builderDelegate: PagedChildBuilderDelegate(
            itemBuilder: (context, item, index) => Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => CoinDetail(
                            item.symbol,
                            widget.currencyCode,
                            widget.currencySymbol,
                          ),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: Container(
                            padding: EdgeInsets.all(4.0),
                            child: Image(
                              width: MediaQuery.of(context).size.width * 0.1,
                              height: MediaQuery.of(context).size.width * 0.1,
                              image: NetworkImage(item.logo),
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              item.name,
                              overflow: TextOverflow.fade,
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.03,
                                color: Colors.grey[800],
                              ),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              "${item.symbol} / ${NumberFormat.compactCurrency(
                                decimalDigits: 2,
                                symbol: '${widget.currencySymbol}',
                              ).format(item.marketCapUSD)}",
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.03,
                                color: Colors.grey[500],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image(
                        width: 15,
                        height: 15,
                        image: AssetImage(item.percentChange24h > 0
                            ? "assets/images/up_arrow_green.png"
                            : "assets/images/down_arrow_red.png"),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '${double.parse((item.percentChange24h).toStringAsFixed(2))}%',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.03,
                          fontWeight: FontWeight.bold,
                          color: item.percentChange24h > 0
                              ? Colors.green[600]
                              : HexColor("#a94442"),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "${item.price > 99999 ? NumberFormat.compactCurrency(
                            decimalDigits: 2,
                            symbol: '${widget.currencySymbol}',
                          ).format(item.price) : '${widget.currencySymbol}' + item.price.toStringAsFixed(2)}",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.03,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.btc,
                            color: Colors.grey[500],
                            size: MediaQuery.of(context).size.width * 0.03,
                          ),
                          Text(
                            "${(item.priceBTC).toStringAsFixed(8)}",
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.03,
                              color: Colors.grey[500],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          separatorBuilder: (context, index) => const Divider(
            color: Colors.black38,
          ),
        ),
      ],
    );
  }
}
