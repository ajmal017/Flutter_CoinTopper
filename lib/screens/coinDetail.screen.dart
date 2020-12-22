import 'package:carousel_slider/carousel_slider.dart';
import 'package:cointopper/bloc/coinDetailBloc/coinDetail_bloc.dart';
import 'package:cointopper/bloc/coinDetailBloc/coinDetail_event.dart';
import 'package:cointopper/bloc/coinDetailBloc/coinDetail_state.dart';
import 'package:cointopper/entities/guides_entity.dart';
import 'package:cointopper/widget/graph.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CoinDetail extends StatefulWidget {
  final String symbol;

  CoinDetail(this.symbol);

  @override
  _CoinDetailState createState() => _CoinDetailState();
}

class _CoinDetailState extends State<CoinDetail> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CoinDetailBloc>(context).add(LoadCoinDetail(widget.symbol));
    return Scaffold(
      body: BlocBuilder<CoinDetailBloc, CoinDetailState>(
          builder: (context, state) {
        if (state is CoinDetailLoadSuccess) {
          var data = state.coinDetail[0];
          final title = data.guides;
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
                          '\$${double.parse((data.price).toStringAsFixed(2))}',
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
                          image: AssetImage(data.percent_change24h > 0
                              ? "assets/images/up_arrow.png"
                              : "assets/images/down_arrow.png"),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '${double.parse((data.percent_change24h).toStringAsFixed(2))}%',
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
                          "${double.parse((data.price_btc).toStringAsFixed(8))}",
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
                                    "\$${data.high24_usd}",
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
                                    "\$${data.low24_usd}",
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
                                  onPressed: () {},
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
//              SingleChildScrollView(
//                child: Column(children: [
//                  Expanded(child: GraphWidget()),
//                  Expanded(
//                    child: cardsBody(
//                      context,
//                      data.volume24h_usd,
//                      data.available_supply,
//                      data.market_cap_usd,
//                      data.intro,
//                      data.youtube,
//                      data.website,
//                      data.explorer,
//                      data.facebook,
//                      data.blog,
//                      data.forum,
//                      data.github,
//                      data.raddit,
//                      data.slack,
//                      data.paper,
//                      data.guides,
//                    ),
//                  ),
//                ],),
//              ),
//              Expanded(child: GraphWidget()),
              Expanded(
                child: cardsBody(
                  context,
                  data.volume24h_usd,
                  data.available_supply,
                  data.market_cap_usd,
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

Widget _buildTotalCap(context, String name, dynamic value) {
  var _formattedValue = NumberFormat.compactCurrency(
    decimalDigits: 2,
    symbol: '\$',
  ).format(value);
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.05,
            color: Colors.black54,
          ),
        ),
        Text(
          _formattedValue,
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.05,
            color: Colors.blue[800],
          ),
        ),
      ],
    ),
  );
}

Widget cardsBody(
  BuildContext context,
  double volume24h_usd,
  int available_supply,
  int market_cap_usd,
  String intro,
  String youtube,
  String website,
  String explorer,
  String facebook,
  String blog,
  String forum,
  String github,
  String raddit,
  String slack,
  String paper,
  List<GuidesEntity> guides,
) {
  List<dynamic> impLinks = [
    {
      'name': 'Website',
      'logo': 'assets/images/browser.png',
      'link': website,
    },
    {
      'name': 'Explorer',
      'logo': 'assets/images/safari.png',
      'link': explorer,
    },
    {
      'name': 'Facebook',
      'logo': 'assets/images/facebook.png',
      'link': facebook,
    },
    {
      'name': 'Blog',
      'logo': 'assets/images/blogger.png',
      'link': blog,
    },
    {
      'name': 'WhitePaper',
      'logo': 'assets/images/origami-white-page.png',
      'link': paper,
    },
    {
      'name': 'Forum',
      'logo': 'assets/images/chat.png',
      'link': forum,
    },
    {
      'name': 'Github',
      'logo': 'assets/images/github.png',
      'link': github,
    },
    {
      'name': 'Reddit',
      'logo': 'assets/images/reddit.png',
      'link': raddit,
    },
    {
      'name': 'Slack',
      'logo': 'assets/images/slack.png',
      'link': slack,
    },
  ];

  Future<void> _launched;
  Future<void> _launchInWebView(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: true,
        enableJavaScript: true,
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget carousel = guides == null
      ? Container(
          child: Center(
            child: Text(
              "No Data Available",
              style: TextStyle(color: Colors.blue),
            ),
          ),
        )
      : CarouselSlider(
          options: CarouselOptions(
            height: 150,
            autoPlay: true,
            viewportFraction: 1,
            aspectRatio: 1,
            enlargeCenterPage: true,
          ),
          items: guides.map<Widget>((data) {
            return GestureDetector(
              onTap: () {
                _launched = _launchInWebView(data.post_link);
              },
              child: new Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: new BoxDecoration(),
                  child: Container(
                    child: Container(
                      margin: EdgeInsets.all(5.0),
                      child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          child: Stack(
                            children: <Widget>[
                              Image.network(
                                data.photo_file,
                                height: 150,
                                width: 350,
                                fit: BoxFit.fill,
                              ),
                              Positioned(
                                bottom: 0.0,
                                left: 0.0,
                                right: 0.0,
                                child: Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Color.fromARGB(200, 0, 0, 0),
                                          Color.fromARGB(0, 0, 0, 0)
                                        ],
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                      ),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 20.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          data.title_en,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                            ],
                          )),
                    ),
                  )),
            );
          }).toList(),
        );

  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: youtube,
    flags: YoutubePlayerFlags(
      enableCaption: true,
      autoPlay: false,
    ),
  );
  var graphSelect = false;
  return SingleChildScrollView(
    child: Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black54,
                  blurRadius: 15.0,
                  offset: Offset(0.0, 0.75))
            ],
            color: Colors.white10,
          ),
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.only(top:8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height:40.0,
                      width: 60.0,
                      child: FlatButton(
                        onPressed: (){},
                        hoverColor: Colors.white10,
                        child: Text('7D'),
                      ),
                    ),
                    Container(
                      height:40.0,
                      width: 60.0,
                      child: FlatButton(
                        onPressed: (){},
                        hoverColor: Colors.white10,
                        child: Text('All'),
                      ),
                    ),
                  ],
                ),
                GraphWidget(),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),
          child: Card(
            elevation: 3,
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  _buildTotalCap(context, "24 Hrs Volume", volume24h_usd),
                  Divider(
                    color: Colors.blue[800],
                    thickness: 2,
                  ),
                  _buildTotalCap(context, "Total Coins", available_supply),
                  Divider(
                    color: Colors.blue[800],
                    thickness: 2,
                  ),
                  _buildTotalCap(context, "Market Cap", market_cap_usd),
                ],
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Card(
            elevation: 3,
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "About",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    intro.replaceAll("<p>", ""),
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 4,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  youtube.length != 0
                      ? YoutubePlayer(
                          controller: _controller,
                          onReady: () {
                            _controller.play();
                          },
                          showVideoProgressIndicator: true,
                          topActions: <Widget>[
                            SizedBox(width: 0.0),
                            Expanded(
                              child: Text(
                                _controller.metadata.title,
                                style: const TextStyle(
                                  color: Colors.red,
                                  fontSize: 12.0,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.play_arrow,
                                color: Colors.white,
                                size: 25.0,
                              ),
                              onPressed: () {},
                            ),
                          ],
                        )
                      : Container(),
                ],
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(10.0),
          child: Card(
            elevation: 3,
            child: Container(
              padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(vertical: 4.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Text(
                      "Important Links",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.06,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  Container(
                    child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: impLinks.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 4.0,
                        mainAxisSpacing: 4.0,
                      ),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            _launched =
                                _launchInWebView(impLinks[index]['link']);
                          },
                          child: Column(
                            children: [
                              CircleAvatar(
                                backgroundImage:
                                    AssetImage('${impLinks[index]['logo']}'),
                                backgroundColor: Colors.transparent,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                impLinks[index]['name'],
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.035,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
          child: Card(
            elevation: 3,
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: GestureDetector(
                onTap: () {
//                  _launched =
//                      _launchInWebView(guides.);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Important Articles",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    guides != null ? carousel : Container(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
