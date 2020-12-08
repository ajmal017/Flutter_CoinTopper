import 'package:carousel_slider/carousel_slider.dart';
import 'package:cointopper/bloc/coinDetailBloc/coinDetail_bloc.dart';
import 'package:cointopper/bloc/coinDetailBloc/coinDetail_event.dart';
import 'package:cointopper/bloc/coinDetailBloc/coinDetail_state.dart';
import 'package:cointopper/entities/guides_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sticky_headers/sticky_headers.dart';
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
                padding: EdgeInsets.only(top: 30, left: 10, right: 10),
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
                                width: 30,
                                height: 30,
                                image: NetworkImage(data.logo),
                              ),
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Text(
                              data.name,
                              style: TextStyle(
                                  fontSize: 18, color: Colors.white60),
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
                              color: Colors.white60,
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "\$${data.price}",
                          style: TextStyle(
                              fontSize: 26,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Image(
                          height: 10,
                          width: 10,
                          image: AssetImage("assets/images/up_arrow.png"),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "${data.percent_change24h}%",
                          style: TextStyle(
                              fontSize: 14,
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
                          "${data.price_btc.toStringAsFixed(8)}",
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
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    "24 HOUR HIGH",
                                    style: TextStyle(
                                        fontSize: 10,
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
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    "24 HOUR LOW",
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.white60,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // width: MediaQuery.of(context).size.width * 0.4,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                width: 6,
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
                                width: 6,
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
//                  data.guides,
                  title,
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

Widget _buildTotalCap(String name, double volume) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black54,
          ),
        ),
        Text(
          (volume >= 1000000 && volume < (1000000 * 10 * 100))
              ? (volume / 1000000).toStringAsFixed(2) + "M"
              : (volume / (1000000 * 10 * 100)).toStringAsFixed(2) + "B",
          style: TextStyle(
            fontSize: 16,
            color: Colors.blue[800],
          ),
        ),
      ],
    ),
  );
}

Widget cardsBody(
  BuildContext context,
  double volume,
  double coin,
  double cap,
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
//  final GuidesEntity guides
  final title,
) {
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

  Widget carousel = title == null
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
            height: 300,
            autoPlay: true,
            viewportFraction: 1,
            aspectRatio: 1.5,
            enlargeCenterPage: true,
          ),
          items: title.map<Widget>((data) {
            return new Container(
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
                              data.photo,
                              height: double.infinity,
                              width: double.infinity,
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
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        data.title,
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
                ));
          }).toList(),
        );

  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: youtube,
    flags: YoutubePlayerFlags(
      enableCaption: true,
    ),
  );
  return SingleChildScrollView(
    child: Column(
      children: [
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
                  _buildTotalCap("24 Hrs Volume", volume),
                  Divider(
                    color: Colors.blue[800],
                    thickness: 2,
                  ),
                  _buildTotalCap("Total Coins", coin),
                  Divider(
                    color: Colors.blue[800],
                    thickness: 2,
                  ),
                  _buildTotalCap("Market Cap", cap),
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
                    overflow: TextOverflow.clip,
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
          margin: EdgeInsets.all(10),
          child: Card(
            elevation: 3,
            child: Container(
              padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StickyHeader(
                    header: Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Text(
                        "Important Links",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                    content: Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              _launched = _launchInWebView(website);
                            },
                            child: Column(
                              children: [
                                CircleAvatar(
                                  child: Image(
                                    width: 100,
                                    image:
                                        AssetImage('assets/images/browser.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("Website"),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              _launched = _launchInWebView(explorer);
                            },
                            child: Column(
                              children: [
                                CircleAvatar(
                                  child: Image(
                                    width: 100,
                                    image:
                                        AssetImage('assets/images/compass.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("Explorer"),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              _launched = _launchInWebView(facebook);
                            },
                            child: Column(
                              children: [
                                CircleAvatar(
                                  child: Image(
                                    width: 100,
                                    image: AssetImage(
                                        'assets/images/facebook.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("Facebook"),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              _launched = _launchInWebView(blog);
                            },
                            child: Column(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.orange[900],
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Image(
                                      width: 100,
                                      image: AssetImage(
                                          'assets/images/blogger.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("Blog"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          _launched = _launchInWebView(forum);
                        },
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.green,
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Image(
                                  width: 100,
                                  image: AssetImage('assets/images/forum.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text("Forum"),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _launched = _launchInWebView(github);
                        },
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Image(
                                width: 100,
                                image: AssetImage('assets/images/github.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text("Github"),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _launched = _launchInWebView(raddit);
                        },
                        child: Column(
                          children: [
                            CircleAvatar(
                              child: Image(
                                width: 100,
                                image: AssetImage('assets/images/reddit.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text("Raddit"),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _launched = _launchInWebView(slack);
                        },
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.grey[200],
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Image(
                                  width: 100,
                                  image: AssetImage('assets/images/slack.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text("Slack"),
                          ],
                        ),
                      ),
                    ],
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
                  title != null
                      ? Container(
                          color: Colors.grey[100],
                          child: Column(
                            children: <Widget>[carousel],
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
