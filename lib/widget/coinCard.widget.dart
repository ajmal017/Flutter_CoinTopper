import 'package:cointopper/bloc/topViewCoinListBloc/topViewedCoinList_bloc.dart';
import 'package:cointopper/bloc/topViewCoinListBloc/topViewedCoinList_state.dart';
import 'package:cointopper/screens/coinDetail.screen.dart';
import 'package:cointopper/screens/topViewedCoin_ViewAll.screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class CoinCardWidget extends StatefulWidget {
  @override
  _CoinCardWidgetState createState() => _CoinCardWidgetState();
}

class _CoinCardWidgetState extends State<CoinCardWidget> {
  @override
  Widget build(BuildContext context) {
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
                                  builder: (_) =>
                                      TopViewedCoinViewAllScreen()));
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
                            state.topViewedCoinsList[index].percent_change24h,
                            state.topViewedCoinsList[index].logo,
                            state.topViewedCoinsList[index].color1,
                            state.topViewedCoinsList[index].color2,
                          );
                  },
                ),
              );
            }
            return Container(
              height: 110.0,
              alignment: AlignmentDirectional.topStart,
              child: FlatButton(
                onPressed: () {
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
    double price,
    double percent_change24h,
    String logo,
    String color1,
    String color2) {
  var _formattedPrice = double.parse((price).toStringAsFixed(4));
  return GestureDetector(
    onTap: () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => CoinDetail(symbol)));
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
                    "\$$_formattedPrice",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
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
                      "\$$percent_change24h%",
                      style: TextStyle(
                        color: Colors.white60,
                        fontSize: 12,
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
