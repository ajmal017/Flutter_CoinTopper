import 'package:cointopper/bloc/top_view_coin_list_bloc/top_viewed_coin_list_bloc.dart';
import 'package:cointopper/bloc/top_view_coin_list_bloc/top_viewed_coin_list_event.dart';
import 'package:cointopper/bloc/top_view_coin_list_bloc/top_viewed_coin_list_state.dart';
import 'package:cointopper/screens/coin_detail_screen.dart';
import 'package:cointopper/screens/top_viewed_coin__view_all_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';

class CoinCardWidget extends StatefulWidget {
  final String currencyCode;
  final String currencySymbol;

  CoinCardWidget(
    this.currencyCode,
    this.currencySymbol,
  );

  @override
  _CoinCardWidgetState createState() => _CoinCardWidgetState();
}

class _CoinCardWidgetState extends State<CoinCardWidget> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<TopViewedCoinListBloc>(context)
        .add(LoadTopViewedCoinList(widget.currencyCode));
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(5.0),
          width: MediaQuery.of(context).size.width * 1,
          child: Text(
            "Top Viewed",
            style: TextStyle(
                color: HexColor("#005580"),
                fontSize: MediaQuery.of(context).size.width * 0.04,
                fontWeight: FontWeight.w600),
          ),
        ),
        BlocBuilder<TopViewedCoinListBloc, TopViewedCoinListState>(
          builder: (context, state) {
            if (state is TopViewedCoinListLoadSuccess) {
              return Container(
                height: 110.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.topViewedCoinsList.length - 4,
                  itemBuilder: (context, index) {
                    return index == 5
                        ? FlatButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => TopViewedCoinViewAllScreen(
                                      widget.currencyCode,
                                      widget.currencySymbol)));
                            },
                            child: Card(
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Container(
                                padding: EdgeInsets.all(10),
                                width: 180,
                                child: Center(
                                  child: Text(
                                    'View All',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        : _cardSlider(
                            context,
                            state.topViewedCoinsList[index].symbol,
                            state.topViewedCoinsList[index].name,
                            state.topViewedCoinsList[index].price,
                            state.topViewedCoinsList[index].percentChange24h,
                            state.topViewedCoinsList[index].logo,
                            state.topViewedCoinsList[index].color1,
                            state.topViewedCoinsList[index].color2,
                            widget.currencyCode,
                            widget.currencySymbol,
                          );
                  },
                ),
              );
            }
            return Container(
              height: 110.0,
              alignment: AlignmentDirectional.topStart,
              child: FlatButton(
                onPressed: () {},
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    width: 180,
                    child: Center(
                      child: Text(
                        'View All',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

Widget _cardSlider(
  BuildContext context,
  String symbol,
  String name,
  dynamic price,
  dynamic percentChange24h,
  String logo,
  String color1,
  String color2,
  String currencyCode,
  dynamic currencySymbol,
) {
  var _formattedPrice = NumberFormat.compactCurrency(
    decimalDigits: 2,
    symbol: '$currencySymbol',
  ).format(price);
  return GestureDetector(
    onTap: () {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => CoinDetail(symbol, currencyCode, currencySymbol)));
    },
    child: Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        padding: EdgeInsets.all(10),
        width: 180,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [HexColor("$color1"), HexColor("$color2")],
            ),
            borderRadius: BorderRadius.circular(12)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    color: Colors.white60,
                    fontSize: 12,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    "${price > 99999 ? _formattedPrice : '$currencySymbol' + price.toStringAsFixed(2)}",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
//                      fontSize: MediaQuery.of(context).size.width *
//                          0.04,
                      fontSize: 20,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Image(
                      width: 12,
                      height: 12,
                      image: AssetImage("assets/images/up_arrow.png"),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      "\$${double.parse((percentChange24h).toStringAsFixed(4))}%",
                      style: TextStyle(
                        color: Colors.white60,
                        fontSize: MediaQuery.of(context).size.width * 0.03,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white30,
              ),
              child: Image(
                width: 32,
                height: 32,
                image: NetworkImage(logo),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
