import 'package:carousel_slider/carousel_slider.dart';
import 'package:cointopper/bloc/coinDetailBloc/coinDetail_bloc.dart';
import 'package:cointopper/bloc/coinDetailBloc/coinDetail_event.dart';
import 'package:cointopper/bloc/coinDetailBloc/coinDetail_state.dart';
import 'package:cointopper/entities/guides_entity.dart';
import 'package:cointopper/widget/graph_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:image_picker_saver/image_picker_saver.dart';
import 'dart:ui' as ui;
import 'dart:typed_data';

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
  GlobalKey _globalKey = new GlobalKey();

  Future<void> _captureScreenshot(_globalKey, var data) async {
    try {
      RenderRepaintBoundary boundary =
          _globalKey.currentContext.findRenderObject();
      ui.Image image = await boundary.toImage();
      ByteData byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      var png = byteData.buffer.asUint8List();
      final snackBar = SnackBar(
        content: Text('Saved to Gallery'),
        backgroundColor: Colors.green,
        action: SnackBarAction(
          label: 'Ok',
          onPressed: () {
            // Some code
          },
        ),
      );

      // _openPopup(png,data);
      // Navigator.of(context).push(
      //   MaterialPageRoute(
      //     builder: (_) => new PreviewScreenshot(photo: png),
      //   ),
      // );

      var filePath = await ImagePickerSaver.saveFile(
          fileData: byteData.buffer.asUint8List());
      print(filePath);
      Scaffold.of(context).showSnackBar(snackBar);
      Navigator.of(context).pop();
    } catch (e) {
      print(e);
    }
  }

  Widget _openPopup(var data) {
    Widget share = FlatButton(
      child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white30,
          ),
          child: Icon(
            Icons.share,
            color: Colors.white,
          )),
      onPressed: () {},
    );
    Widget download = FlatButton(
      child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white30,
          ),
          child: Icon(
            Icons.arrow_downward,
            color: Colors.white,
          )),
      onPressed: () {
        FocusScope.of(context).requestFocus(FocusNode());
        _captureScreenshot(_globalKey, data);
      },
    );
    Widget close = FlatButton(
      child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white30,
          ),
          child: Icon(
            Icons.close,
            color: Colors.white,
          )),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    var currDt = DateTime.now();
    String formattedDate = DateFormat('dd MMM yyyy \n kk:mm:ss').format(currDt);
    var cap = (data.marketCapUSD >= 1000000 &&
            data.marketCapUSD < (1000000 * 10 * 100))
        ? (data.marketCapUSD / 1000000).toStringAsFixed(2) + "M"
        : (data.marketCapUSD / (1000000 * 10 * 100)).toStringAsFixed(2) + "B";

    AlertDialog alert = AlertDialog(
      actionsOverflowDirection: VerticalDirection.up,
      actionsPadding: EdgeInsets.all(0),
      elevation: 0,
      titlePadding: EdgeInsets.all(0),
      backgroundColor: Colors.transparent,
      contentPadding: EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 0),
      actionsOverflowButtonSpacing: 0,
      buttonPadding: EdgeInsets.all(0),
      insetPadding: EdgeInsets.all(0),
      content: Container(
        height: 240,
        child: new Column(
          children: <Widget>[
            RepaintBoundary(
              key: _globalKey,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 3,
                child: Container(
                  height: 200,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
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
                                "${data.name}/${data.symbol}",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white60),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "\$${data.price.toStringAsFixed(2)}",
                            style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Image(
                            height: 10,
                            width: 10,
                            image: AssetImage(data.percentChange24h > 0
                                ? "assets/images/up_arrow.png"
                                : "assets/images/down_arrow.png"),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "${data.percentChange24h.toStringAsFixed(2)}%",
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
                            "${data.priceBTC.toStringAsFixed(8)}",
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "\$${data.high24USD.toStringAsFixed(2)}",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "24 HOUR HIGH",
                                      style: TextStyle(
                                          fontSize: 8,
                                          color: Colors.white60,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "\$${data.low24USD.toStringAsFixed(2)}",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "24 HOUR LOW",
                                      style: TextStyle(
                                          fontSize: 8,
                                          color: Colors.white60,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "\$$cap",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Market Cap",
                                      style: TextStyle(
                                          fontSize: 8,
                                          color: Colors.white60,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
//                                  height:MediaQuery.of(context).size.height * 0.2,
                                  height:20,
//                                  width:MediaQuery.of(context).size.width * 0.2,
                                  width:20,
                                  child: GraphWidget(
                                      data.marketId, '#FFFFFF', '#FFFFFF'),
                                ),
                                Text(
                                  "$formattedDate ISD",
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.white60,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Image(
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  image: AssetImage('assets/images/logo.png'),
                                  fit: BoxFit.cover,
                                ),
//                                SizedBox(
//                                  height: 5,
//                                ),
//                                Text(
//                                  "CoinTopper.com",
//                                  style: TextStyle(
//                                      fontSize: 8,
//                                      color: Colors.white60,
//                                      fontWeight: FontWeight.bold),
//                                ),
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
          ],
        ),
      ),
      actions: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              share,
              download,
              close,
            ],
          ),
        )
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(child: alert);
      },
    );
  }

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
                                    _openPopup(data);
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
                child: cardsBody(
                  context,
                  data.marketId,
                  data.color1,
                  data.color2,
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

Widget _buildTotalCap(
    context, String name, dynamic value, dynamic currencySymbol) {
  var _formattedValue = NumberFormat.compactCurrency(
    decimalDigits: 2,
    symbol: '$currencySymbol',
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
  int marketId,
  String color1,
  String color2,
  double volume24hUSD,
  dynamic availableSupply,
  dynamic marketCapUSD,
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
  String currencySymbol,
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
                _launchInWebView(data.postLink);
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
                                data.photoFile,
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
                                          data.titleEN,
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

  return SingleChildScrollView(
    child: Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
//            boxShadow: <BoxShadow>[
//              BoxShadow(
//                  color: Colors.black54,
//                  blurRadius: 15.0,
//                  offset: Offset(0.0, 0.75))
//            ],
            color: Colors.white10,
          ),
          child: GraphWidget(marketId, color1, color2),
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
                  _buildTotalCap(
                      context, "24 Hrs Volume", volume24hUSD, currencySymbol),
                  Divider(
                    color: Colors.blue[800],
                    thickness: 2,
                  ),
                  _buildTotalCap(
                      context, "Total Coins", availableSupply, currencySymbol),
                  Divider(
                    color: Colors.blue[800],
                    thickness: 2,
                  ),
                  _buildTotalCap(
                      context, "Market Cap", marketCapUSD, currencySymbol),
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
//                      _launchInWebView(guides);
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
