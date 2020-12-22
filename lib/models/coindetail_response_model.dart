import 'package:cointopper/entities/coinDetail_entity.dart';
import 'package:cointopper/entities/guides_entity.dart';
import 'package:meta/meta.dart';

@immutable
class CoinDetailResponseModel {
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

  CoinDetailResponseModel(
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

  CoinDetailEntity toEntity() {
    return CoinDetailEntity(
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
    );
  }

  static CoinDetailResponseModel fromEntity(CoinDetailEntity entity) {
    return CoinDetailResponseModel(
      entity.id,
      entity.name,
      entity.full_name,
      entity.rank,
      entity.symbol,
      entity.slug,
      entity.algorithm,
      entity.social,
      entity.logo,
      entity.category,
      entity.proof_type,
      entity.icon,
      entity.is_premined,
      entity.intro,
      entity.price,
      entity.price_usd,
      entity.price_btc,
      entity.market_cap_usd,
      entity.volume24h_usd,
      entity.volume24h_usd_to,
      entity.available_supply,
      entity.max_supply,
      entity.percent_change1h,
      entity.percent_change24h,
      entity.change,
      entity.percent_change7d,
      entity.last_updated,
      entity.open24_usd,
      entity.close24_usd,
      entity.low24_usd,
      entity.high24_usd,
      entity.summary,
      entity.website,
      entity.explorer,
      entity.forum,
      entity.github,
      entity.twitter,
      entity.twitter_hash,
      entity.facebook,
      entity.raddit,
      entity.blog,
      entity.slack,
      entity.paper,
      entity.youtube,
      entity.telegram,
      entity.linkedin,
      entity.color1,
      entity.color2,
      entity.technology,
      entity.pairs,
      entity.url,
      entity.url_data,
      entity.tradingview_id,
      entity.intraday_quotes,
      entity.is_active,
      entity.market_id,
      entity.created_at,
      entity.updated_at,
      entity.guides,
    );
  }
}
