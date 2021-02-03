import 'package:cointopper/entities/guides_entity.dart';
import 'package:cointopper/widget/graph_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:readmore/readmore.dart';

import 'coin_details_widgets/coin_important_links.dart';
import 'coin_details_widgets/details_img_carousel.dart';
import 'coin_details_widgets/details_youtube_player.dart';

class CoinDetailCardComponentWidget extends StatefulWidget {
  final double volume;
  final dynamic availableSupply;
  final dynamic marketCapUSD;
  final String intro;
  final String youtube;
  final String website;
  final String explorer;
  final String facebook;
  final String blog;
  final String forum;
  final String github;
  final String raddit;
  final String slack;
  final String paper;
  final List<GuidesEntity> guides;
  final int marketId;
  final String color1;
  final String color2;
  final String currencySymbol;

  CoinDetailCardComponentWidget(
    this.volume,
    this.availableSupply,
    this.marketCapUSD,
    this.intro,
    this.youtube,
    this.website,
    this.explorer,
    this.facebook,
    this.blog,
    this.forum,
    this.github,
    this.raddit,
    this.slack,
    this.paper,
    this.guides,
    this.marketId,
    this.color1,
    this.color2,
    this.currencySymbol,
  );

  @override
  _CoinDetailCardComponentWidgetState createState() =>
      _CoinDetailCardComponentWidgetState();
}

class _CoinDetailCardComponentWidgetState
    extends State<CoinDetailCardComponentWidget> {
  String removeAllHtmlTags(String htmlText) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    return htmlText.replaceAll(exp, '');
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            padding: EdgeInsets.all(16.0),
            child: GraphWidget(
                widget.marketId, widget.color1, widget.color2, true, true),
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
                      context,
                      "24 Hrs Volume",
                      widget.volume,
                      widget.currencySymbol,
                    ),
                    Divider(
                      color: Colors.blue[800],
                      thickness: 2,
                    ),
                    _buildTotalCap(
                      context,
                      "Total Coins",
                      widget.availableSupply,
                      widget.currencySymbol,
                    ),
                    Divider(
                      color: Colors.blue[800],
                      thickness: 2,
                    ),
                    _buildTotalCap(
                      context,
                      "Market Cap",
                      widget.marketCapUSD,
                      widget.currencySymbol,
                    ),
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
                    ReadMoreText(
                      removeAllHtmlTags(widget.intro),
                      trimLines: 1,
                      colorClickableText: Colors.blue,
                      trimCollapsedText: '...Show more',
                      trimExpandedText: ' show less',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    DetailsYoutubePlayer(widget.youtube),
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
                    CoinImportantLinks(
                      widget.youtube,
                      widget.website,
                      widget.explorer,
                      widget.facebook,
                      widget.blog,
                      widget.forum,
                      widget.github,
                      widget.raddit,
                      widget.slack,
                      widget.paper,
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
                    DetailsImageCarousel(widget.guides),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
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
}
