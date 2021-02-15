import 'package:cointopper/bloc/coin_detail_bloc/coin_detail_bloc.dart';
import 'package:cointopper/bloc/coin_detail_bloc/coin_detail_event.dart';
import 'package:cointopper/bloc/coin_detail_bloc/coin_detail_state.dart';
import 'package:cointopper/widget/coin_detail_card_component_widget.dart';
import 'package:cointopper/widget/coin_detail_card_screenshot_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';

class CoinDetail extends StatefulWidget {
  final String symbol;
  final String currencyCode;
  final dynamic currencySymbol;

  CoinDetail(
    this.symbol,
    this.currencyCode,
    this.currencySymbol,
  );

  @override
  _CoinDetailState createState() => _CoinDetailState();
}

class _CoinDetailState extends State<CoinDetail> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CoinDetailBloc>(context)
        .add(LoadCoinDetail(widget.symbol, widget.currencyCode));
    return Scaffold(
      body: BlocBuilder<CoinDetailBloc, CoinDetailState>(
          builder: (context, state) {
        if (state is CoinDetailLoadSuccess) {
          var data = state.coinDetail[0];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                padding: EdgeInsets.only(top: 32, left: 8, right: 8),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [HexColor(data.color1), HexColor(data.color2)],
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.white30,
                              ),
                              child: Image(
                                width: 32,
                                height: 32,
                                image: NetworkImage(data.logo),
                              ),
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Text(
                              '${data.name}/ ${data.symbol}',
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.05,
                                color: Colors.white60,
                              ),
                            ),
                          ],
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
                              size: MediaQuery.of(context).size.width * 0.05,
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "${data.price > 99999 ? NumberFormat.compactCurrency(
                              decimalDigits: 2,
                              symbol: '${widget.currencySymbol}',
                            ).format(data.price) : '${widget.currencySymbol}' + data.price.toStringAsFixed(2)}",
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.08,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Image(
                          height: 12,
                          width: 12,
                          image: AssetImage(data.percentChange24h > 0
                              ? "assets/images/up_arrow.png"
                              : "assets/images/down_arrow.png"),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '${double.parse((data.percentChange24h).toStringAsFixed(2))}%',
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.03,
                              color: Colors.white60,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.btc,
                          color: Colors.white60,
                          size: 14,
                        ),
                        Text(
                          "${double.parse((data.priceBTC).toStringAsFixed(8))}",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.white60,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "${data.high24USD > 99999 ? NumberFormat.compactCurrency(
                                        decimalDigits: 2,
                                        symbol: '${widget.currencySymbol}',
                                      ).format(data.high24USD) : '${widget.currencySymbol}' + data.high24USD.toStringAsFixed(2)}",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.05,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    "24 HRS HIGH",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.025,
                                        color: Colors.white60,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "${data.low24USD > 99999 ? NumberFormat.compactCurrency(
                                        decimalDigits: 2,
                                        symbol: '${widget.currencySymbol}',
                                      ).format(data.low24USD) : '${widget.currencySymbol}' + data.low24USD.toStringAsFixed(2)}",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.05,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    "24 HRS LOW",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.025,
                                        color: Colors.white60,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.12,
                                decoration: BoxDecoration(
                                  color: Colors.white24,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.alarm,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.12,
                                decoration: BoxDecoration(
                                  color: Colors.white24,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.star_border,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.12,
                                decoration: BoxDecoration(
                                  color: Colors.white24,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Center(
                                          child: CoinDetailCardWidget(
                                              data, widget.currencySymbol),
                                        );
                                      },
                                    );
                                  },
                                  icon: Icon(
                                    Icons.pages,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: CoinDetailCardComponentWidget(
                  data.volume24hUSD,
                  data.availableSupply,
                  data.marketCapUSD,
                  data.intro,
                  data.youtube,
                  data.website,
                  data.explorer,
                  data.facebook,
                  data.blog,
                  data.forum,
                  data.github,
                  data.raddit,
                  data.slack,
                  data.paper,
                  data.guides,
                  data.marketId,
                  data.color1,
                  data.color2,
                  widget.currencySymbol,
                ),
              ),
            ],
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
  }
}
