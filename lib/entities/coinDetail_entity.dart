import 'package:cointopper/entities/guides_entity.dart';
import 'package:equatable/equatable.dart';

class CoinDetailEntity extends Equatable {
  final int id;
  final String name;
  final String full_name;
  final int rank;
  final String symbol;
  final String slug;
  final String algorithm;
  final String social;
  final String logo;
  final String category;
  final String proof_type;
  final String icon;
  final String is_premined;
  final String intro;
  final double price;
  final double price_usd;
  final dynamic price_btc;
  final int market_cap_usd;
  final double volume24h_usd;
  final int volume24h_usd_to;
  final int available_supply;
  final int max_supply;
  final String percent_change1h;
  final double percent_change24h;
  final String change;
  final String percent_change7d;
  final String last_updated;
  final double open24_usd;
  final double close24_usd;
  final double low24_usd;
  final double high24_usd;
  final String summary;
  final String website;
  final String explorer;
  final String forum;
  final String github;
  final String twitter;
  final String twitter_hash;
  final String facebook;
  final String raddit;
  final String blog;
  final String slack;
  final String paper;
  final String youtube;
  final String telegram;
  final String linkedin;
  final String color1;
  final String color2;
  final String technology;
  final String pairs;
  final String url;
  final String url_data;
  final String tradingview_id;
  final String intraday_quotes;
  final int is_active;
  final int market_id;
  final String created_at;
  final String updated_at;
  final List<GuidesEntity> guides;

  CoinDetailEntity(
    this.id,
    this.name,
    this.full_name,
    this.rank,
    this.symbol,
    this.slug,
    this.algorithm,
    this.social,
    this.logo,
    this.category,
    this.proof_type,
    this.icon,
    this.is_premined,
    this.intro,
    this.price,
    this.price_usd,
    this.price_btc,
    this.market_cap_usd,
    this.volume24h_usd,
    this.volume24h_usd_to,
    this.available_supply,
    this.max_supply,
    this.percent_change1h,
    this.percent_change24h,
    this.change,
    this.percent_change7d,
    this.last_updated,
    this.open24_usd,
    this.close24_usd,
    this.low24_usd,
    this.high24_usd,
    this.summary,
    this.website,
    this.explorer,
    this.forum,
    this.github,
    this.twitter,
    this.twitter_hash,
    this.facebook,
    this.raddit,
    this.blog,
    this.slack,
    this.paper,
    this.youtube,
    this.telegram,
    this.linkedin,
    this.color1,
    this.color2,
    this.technology,
    this.pairs,
    this.url,
    this.url_data,
    this.tradingview_id,
    this.intraday_quotes,
    this.is_active,
    this.market_id,
    this.created_at,
    this.updated_at,
    this.guides,
  );

  @override
  List<Object> get props => [
        id,
        name,
        full_name,
        rank,
        symbol,
        slug,
        algorithm,
        social,
        logo,
        category,
        proof_type,
        icon,
        is_premined,
        intro,
        price,
        price_usd,
        price_btc,
        market_cap_usd,
        volume24h_usd,
        volume24h_usd_to,
        available_supply,
        max_supply,
        percent_change1h,
        percent_change24h,
        change,
        percent_change7d,
        last_updated,
        open24_usd,
        close24_usd,
        low24_usd,
        high24_usd,
        summary,
        website,
        explorer,
        forum,
        github,
        twitter,
        twitter_hash,
        facebook,
        raddit,
        blog,
        slack,
        paper,
        youtube,
        telegram,
        linkedin,
        color1,
        color2,
        technology,
        pairs,
        url,
        url_data,
        tradingview_id,
        intraday_quotes,
        is_active,
        market_id,
        created_at,
        updated_at,
        guides,
      ];

  Map<String, Object> toJson() {
    return {
      "id": id,
      "name": name,
      "full_name": full_name,
      "rank": rank,
      "symbol": symbol,
      "slug": slug,
      "algorithm": algorithm,
      "social": social,
      "logo": logo,
      "category": category,
      "proof_type": proof_type,
      "icon": icon,
      "is_premined": is_premined,
      "intro": intro,
      "price": price,
      "price_usd": price_usd,
      "price_btc": price_btc,
      "market_cap_usd": market_cap_usd,
      "volume24h_usd": volume24h_usd,
      "volume24h_usd_to": volume24h_usd_to,
      "available_supply": available_supply,
      "max_supply": max_supply,
      "percent_change1h": percent_change1h,
      "percent_change24h": percent_change24h,
      "change": change,
      "percent_change7d": percent_change7d,
      "last_updated": last_updated,
      "open24_usd": open24_usd,
      "close24_usd": close24_usd,
      "low24_usd": low24_usd,
      "high24_usd": high24_usd,
      "summary": summary,
      "website": website,
      "explorer": explorer,
      "forum": forum,
      "github": github,
      "twitter": twitter,
      "twitter_hash": twitter_hash,
      "facebook": facebook,
      "raddit": raddit,
      "blog": blog,
      "slack": slack,
      "paper": paper,
      "youtube": youtube,
      "telegram": telegram,
      "linkedin": linkedin,
      "color1": color1,
      "color2": color2,
      "technology": technology,
      "pairs": pairs,
      "url": url,
      "url_data": url_data,
      "tradingview_id": tradingview_id,
      "intraday_quotes": intraday_quotes,
      "is_active": is_active,
      "market_id": market_id,
      "created_at": created_at,
      "updated_at": updated_at,
      "guides": guides,
    };
  }

  static CoinDetailEntity fromJson(Map<String, Object> json) {
    var guidesList = json['guides'] as List;
    List<GuidesEntity> _guides =
        guidesList.map((i) => GuidesEntity.fromJson(i)).toList();
    return CoinDetailEntity(
      json["id"] as int,
      json["name"] as String,
      json["full_name"] as String,
      json["rank"] as int,
      json["symbol"] as String,
      json["slug"] as String,
      json["algorithm"] as String,
      json["social"] as String,
      json["logo"] as String,
      json["category"] as String,
      json["proof_type"] as String,
      json["icon"] as String,
      json["is_premined"] as String,
      json["intro"] as String,
      json["price"] as double,
      json["price_usd"] as double,
      json["price_btc"] as dynamic,
      json["market_cap_usd"] as int,
      json["volume24h_usd"] as double,
      json["volume24h_usd_to"] as int,
      json["available_supply"] as int,
      json["max_supply"] as int,
      json["percent_change1h"] as String,
      json["percent_change24h"] as double,
      json["change"] as String,
      json["percent_change7d"] as String,
      json["last_updated"] as String,
      json["open24_usd"] as double,
      json["close24_usd"] as double,
      json["low24_usd"] as double,
      json["high24_usd"] as double,
      json["summary"] as String,
      json["website"] as String,
      json["explorer"] as String,
      json["forum"] as String,
      json["github"] as String,
      json["twitter"] as String,
      json["twitter_hash"] as String,
      json["facebook"] as String,
      json["raddit"] as String,
      json["blog"] as String,
      json["slack"] as String,
      json["paper"] as String,
      json["youtube"] as String,
      json["telegram"] as String,
      json["linkedin"] as String,
      json["color1"] as String,
      json["color2"] as String,
      json["technology"] as String,
      json["pairs"] as String,
      json["url"] as String,
      json["url_data"] as String,
      json["tradingview_id"] as String,
      json["intraday_quotes"] as String,
      json["is_active"] as int,
      json["market_id"] as int,
      json["created_at"] as String,
      json["updated_at"] as String,
      _guides,
    );
  }
}
