import 'package:flutter/material.dart';

class CoinList extends StatelessWidget {
  dynamic data = [
    {
      "percent_change24h": 4.46,
      "logo": "bitcoin.png",
      "price_btc": 1,
      "price": 9120.78134585,
      "market_cap_usd": 166497464703,
      "symbol": "BTC",
      "name": "Bitcoin ",
    },
    {
      "percent_change24h": 3.49,
      "logo": "dogecoin-doge.png",
      "price_btc": 0.025316385757352136,
      "price": 230.90521896,
      "market_cap_usd": 25393639648,
      "symbol": "ETH",
      "name": "Ethereum ",
    },
    {
      "percent_change24h": 2.61,
      "logo": "tron--TRX15308837411406.png",
      "price_btc": 2.6284052967575944e-5,
      "price": 0.2397311,
      "market_cap_usd": 10504539433,
      "symbol": "XRP",
      "name": "Ripple ",
    },
    {
      "percent_change24h": 5.77,
      "logo": "ripple-xrp-new.png",
      "price_btc": 0.036906988080924005,
      "price": 336.62056842,
      "market_cap_usd": 6165037400,
      "symbol": "BCH",
      "name": "Bitcoin Cash ",
    },
    {
      "percent_change24h": 0.44,
      "logo": "bitcoin-cash-bch.jpg",
      "price_btc": 0.00010997168575435508,
      "price": 1.0030277,
      "market_cap_usd": 4656423087,
      "symbol": "USDT",
      "name": "Tether ",
    },
    {
      "percent_change24h": 3.34,
      "logo": "bitcoin-cash-bch.jpg",
      "price_btc": 0.006818480802447555,
      "price": 62.18987251,
      "market_cap_usd": 3994290688,
      "symbol": "LTC",
      "name": "Litecoin ",
    },
    {
      "percent_change24h": 5.44,
      "logo": "bitcoin.png",
      "price_btc": 0.0004140673059461489,
      "price": 3.77661736,
      "market_cap_usd": 3477052686,
      "symbol": "EOS",
      "name": "EOS ",
    },
    {
      "percent_change24h": 5.22,
      "logo": "dogecoin-doge.png",
      "price_btc": 0.0022918201157745167,
      "price": 20.90319016,
      "market_cap_usd": 3251213488,
      "symbol": "BNB",
      "name": "Binance Coin ",
    },
    {
      "percent_change24h": 8.04,
      "logo": "tron--TRX15308837411406.png",
      "price_btc": 0.0003463277454225191,
      "price": 3.15877964,
      "market_cap_usd": 2219873927,
      "symbol": "XTZ",
      "name": "Tezos",
    },
    {
      "percent_change24h": -0.38,
      "logo": "ripple-xrp-new.png",
      "price_btc": 0.0005116284387327472,
      "price": 4.66645112,
      "market_cap_usd": 1633257891,
      "symbol": "LINK",
      "name": "ChainLink ",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: DataTable(
        columnSpacing: 8.0,
        horizontalMargin: 4.0,
        showBottomBorder: true,
        dataRowHeight: MediaQuery.of(context).size.height * 0.07,
        columns: [
          DataColumn(
            label: Container(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'NAME/  M.CAP',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.03,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF005580),
                ),
              ),
            ),
          ),
          DataColumn(
            label: Text(
              'CHANGE',
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.03,
                fontWeight: FontWeight.w600,
                color: Color(0xFF005580),
              ),
            ),
          ),
          DataColumn(
            label: Text(
              'PRICE',
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.03,
                fontWeight: FontWeight.w600,
                color: Color(0xFF005580),
              ),
            ),
          ),
        ],
        rows: [
          DataRow(cells: [
            DataCell(
              GestureDetector(
                onTap: () {
//                      Navigator.of(context).push(MaterialPageRoute(
//                        builder: (){},
//                      ));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(4.0),
                      child: Image(
                        width: MediaQuery.of(context).size.width * 0.1,
                        height: MediaQuery.of(context).size.width * 0.1,
//                            image: AssetImage("assets/images/${data.logo}"),
                        image: AssetImage("assets/images/bitcoin.png"),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
//                              data.name,
                          'Bitcoin',
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
//                              "${data.symbol} / ${data.marketCap}",
                          "BTC/166.50 B",
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
            ),
            DataCell(
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image(
                    width: 15,
                    height: 15,
                    image: AssetImage("assets/images/up_arrow_green.png"),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
//                      '${data.percentChange24h}%',
                    '4.46%',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.03,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[600],
                    ),
                  ),
                ],
              ),
            ),
            DataCell(
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
//                      "\$${data.price}",
                    "\$${9120.78}",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.03,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
//                      "B${data.priceBTC}",
                    "B1.00000000",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.03,
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
            ),
          ])
        ],
      ),
    );
  }
}
