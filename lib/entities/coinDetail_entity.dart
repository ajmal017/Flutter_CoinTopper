import 'package:cointopper/entities/guides_entity.dart';
import 'package:equatable/equatable.dart';

class CoinDetailEntity extends Equatable {
  final int id;
  final String name;
  final String fullName;
  final int rank;
  final String symbol;
  final String slug;
  final String algorithm;
  final String social;
  final String logo;
  final String category;
  final String proofType;
  final String icon;
  final String isPremined;
  final String intro;
  final double price;
  final double priceUSD;
  final dynamic priceBTC;
  final dynamic marketCapUSD;
  final double volume24hUSD;
  final int volume24hUSDTo;
  final dynamic availableSupply;
  final int maxSupply;
  final String percentChange1h;
  final double percentChange24h;
  final String change;
  final String percentChange7d;
  final String lastUpdated;
  final double open24USD;
  final double close24USD;
  final double low24USD;
  final double high24USD;
  final String summary;
  final String website;
  final String explorer;
  final String forum;
  final String github;
  final String twitter;
  final String twitterHash;
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
  final String urlData;
  final String tradingViewId;
  final String intradayQuotes;
  final int isActive;
  final int marketId;
  final String createdAt;
  final String updatedAt;
  final List<GuidesEntity> guides;

  CoinDetailEntity(
    this.id,
    this.name,
    this.fullName,
    this.rank,
    this.symbol,
    this.slug,
    this.algorithm,
    this.social,
    this.logo,
    this.category,
    this.proofType,
    this.icon,
    this.isPremined,
    this.intro,
    this.price,
    this.priceUSD,
    this.priceBTC,
    this.marketCapUSD,
    this.volume24hUSD,
    this.volume24hUSDTo,
    this.availableSupply,
    this.maxSupply,
    this.percentChange1h,
    this.percentChange24h,
    this.change,
    this.percentChange7d,
    this.lastUpdated,
    this.open24USD,
    this.close24USD,
    this.low24USD,
    this.high24USD,
    this.summary,
    this.website,
    this.explorer,
    this.forum,
    this.github,
    this.twitter,
    this.twitterHash,
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
    this.urlData,
    this.tradingViewId,
    this.intradayQuotes,
    this.isActive,
    this.marketId,
    this.createdAt,
    this.updatedAt,
    this.guides,
  );

  @override
  List<Object> get props => [
    id,
    name,
    fullName,
    rank,
    symbol,
    slug,
    algorithm,
    social,
    logo,
    category,
    proofType,
    icon,
    isPremined,
    intro,
    price,
    priceUSD,
    priceBTC,
    marketCapUSD,
    volume24hUSD,
    volume24hUSDTo,
    availableSupply,
    maxSupply,
    percentChange1h,
    percentChange24h,
    change,
    percentChange7d,
    lastUpdated,
    open24USD,
    close24USD,
    low24USD,
    high24USD,
    summary,
    website,
    explorer,
    forum,
    github,
    twitter,
    twitterHash,
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
    urlData,
    tradingViewId,
    intradayQuotes,
    isActive,
    marketId,
    createdAt,
    updatedAt,
    guides,
  ];

  Map<String, Object> toJson() {
    return {
      "id": id,
      "name": name,
      "full_name": fullName,
      "rank": rank,
      "symbol": symbol,
      "slug": slug,
      "algorithm": algorithm,
      "social": social,
      "logo": logo,
      "category": category,
      "proof_type": proofType,
      "icon": icon,
      "is_premined": isPremined,
      "intro": intro,
      "price": price,
      "price_usd": priceUSD,
      "price_btc": priceBTC,
      "market_cap_usd": marketCapUSD,
      "volume24h_usd": volume24hUSD,
      "volume24h_usd_to": volume24hUSDTo,
      "available_supply": availableSupply,
      "max_supply": maxSupply,
      "percent_change1h": percentChange1h,
      "percent_change24h": percentChange24h,
      "change": change,
      "percent_change7d": percentChange7d,
      "last_updated": lastUpdated,
      "open24_usd": open24USD,
      "close24_usd": close24USD,
      "low24_usd": low24USD,
      "high24_usd": high24USD,
      "summary": summary,
      "website": website,
      "explorer": explorer,
      "forum": forum,
      "github": github,
      "twitter": twitter,
      "twitter_hash": twitterHash,
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
      "url_data": urlData,
      "tradingview_id": tradingViewId,
      "intraday_quotes": intradayQuotes,
      "is_active": isActive,
      "market_id": marketId,
      "created_at": createdAt,
      "updated_at": updatedAt,
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
      json["market_cap_usd"] as dynamic,
      json["volume24h_usd"] as double,
      json["volume24h_usd_to"] as int,
      json["available_supply"] as dynamic,
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
