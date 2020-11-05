import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CoinCard extends StatefulWidget {
  @override
  _CoinCardState createState() => _CoinCardState();
}

class _CoinCardState extends State<CoinCard> {
  dynamic data = [
    {
      "logo": "bitcoin.png",
      "price": 9120.78,
      "name": "Bitcoin ",
      "percent_change24h": 4.46,
      "color1": 0xFFF8A040,
      "color2": 0xFFF8A008,
    },
    {
      "logo": "dogecoin-doge.png",
      "price": 0.001233,
      "name": "Dogecoin ",
      "percent_change24h": 4.66,
      "color1": 0xFFB8A030,
      "color2": 0xFFB8A028,
    },
    {
      "logo": "tron--TRX15308837411406.png",
      "price": 0.01,
      "name": "TRON ",
      "percent_change24h": 4.17,
      "color1": 0xFFE70814,
      "color2": 0xFFDE4546,
    },
    {
      "logo": "ripple-xrp-new.png",
      "price": 0.23,
      "name": "Ripple ",
      "percent_change24h": 2.61,
      "color1": 0xFF818181,
      "color2": 0xFF0e0e0e,
    },
    {
      "logo": "bitcoin-cash-bch.jpg",
      "price": 336.62,
      "name": "Bitcoin Cash ",
      "percent_change24h": 5.77,
      "color1": 0xFFF09018,
      "color2": 0xFFF89828,
    },
    {
      "logo": "bitcoin-cash-bch.jpg",
      "price": 336.62,
      "name": "Bitcoin Cash ",
      "percent_change24h": 5.77,
      "color1": 0xFFF09018,
      "color2": 0xFFF89828,
    },
  ];

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
        Container(
          height: 110.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: data.length,
            itemBuilder: (context, index) {
              return index == 5
                  ? FlatButton(
                      onPressed: () {
                        print('View All Button pressed');
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
                      data[index]['name'],
                      data[index]['price'],
                      data[index]['percent_change24h'],
                      data[index]['logo'],
                      data[index]['color1'],
                      data[index]['color2'],
                    );
            },
          ),
        ),
      ],
    );
  }
}

Widget _cardSlider(BuildContext context, String coin, double rate, double price,
    String imageUrl, int lcolor, int rcolor) {
  return Card(
    elevation: 3,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    child: Container(
      padding: EdgeInsets.all(10),
//      width: MediaQuery.of(context).size.width * 0.4,
      width: 180,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Color(lcolor), Color(rcolor)],
          ),
          borderRadius: BorderRadius.circular(12)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
//            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                coin,
                style: TextStyle(
                  color: Colors.white60,
                  fontSize: 12,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  "\$$rate",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
//                    fontSize: MediaQuery.of(context).size.width * 0.06,
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
                    "\$$price%",
                    style: TextStyle(
                      color: Colors.white60,
//                      fontSize: MediaQuery.of(context).size.width * 0.03,
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
              image: AssetImage("assets/images/$imageUrl"),
            ),
          ),
        ],
      ),
    ),
  );
}
