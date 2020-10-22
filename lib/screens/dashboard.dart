import 'package:cointopper/widget/coinCard.widget.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color(0xFF003399),
                    const Color(0xFF0073e6),
                  ],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(1.0, 0.0),
                  stops: [0.0, 1.0],
//                tileMode: TileMode.clamp,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome to CoinTopper',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width * 0.04,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Cryptocurrencies',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width * 0.08,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'CRYPTOM.CAP',
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width * 0.03,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '\$267.00 B',
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width * 0.04,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
//                      padding: EdgeInsets.all(0),
                          height: 40,
                          width: MediaQuery.of(context).size.width * 0.4,
                          decoration: BoxDecoration(
                            color: Color(0xFF2e5cb8),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: FlatButton(
                            onPressed: () => {
                              print('Search button pressed'),
                            },
                            child: Text(
                              'Search',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8),
                          height: 40,
                          width: MediaQuery.of(context).size.width * 0.2,
                          decoration: BoxDecoration(
                            color: Color(0xFF2e5cb8),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            'USD',
                            style: TextStyle(fontSize: 18, color: Colors.white60),
                          ),
                        ),
                        Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width * 0.15,
                          decoration: BoxDecoration(
                            color: Color(0xFF2e5cb8),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.star_border,
                              color: Colors.white60,
                              size: 21,
                            ),
                          ),
                        ),
                        Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width * 0.15,
                          decoration: BoxDecoration(
                            color: Color(0xFF2e5cb8),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.notifications_active,
                              color: Colors.white60,
                              size: 21,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            CoinCard(),
          ],
        ),
      ),
    );
  }
}
