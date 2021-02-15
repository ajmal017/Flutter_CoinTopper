import 'package:cointopper/entities/coin_detail_entity.dart';
import 'package:cointopper/entities/guides_entity.dart';
import 'package:meta/meta.dart';

@immutable
class CoinDetailResponseModel {
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

  CoinDetailResponseModel(
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

  CoinDetailEntity toEntity() {
    return CoinDetailEntity(
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
    );
  }

  static CoinDetailResponseModel fromEntity(CoinDetailEntity entity) {
    return CoinDetailResponseModel(
      entity.id,
      entity.name,
      entity.fullName,
      entity.rank,
      entity.symbol,
      entity.slug,
      entity.algorithm,
      entity.social,
      entity.logo,
      entity.category,
      entity.proofType,
      entity.icon,
      entity.isPremined,
      entity.intro,
      entity.price,
      entity.priceUSD,
      entity.priceBTC,
      entity.marketCapUSD,
      entity.volume24hUSD,
      entity.volume24hUSDTo,
      entity.availableSupply,
      entity.maxSupply,
      entity.percentChange1h,
      entity.percentChange24h,
      entity.change,
      entity.percentChange7d,
      entity.lastUpdated,
      entity.open24USD,
      entity.close24USD,
      entity.low24USD,
      entity.high24USD,
      entity.summary,
      entity.website,
      entity.explorer,
      entity.forum,
      entity.github,
      entity.twitter,
      entity.twitterHash,
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
      entity.urlData,
      entity.tradingViewId,
      entity.intradayQuotes,
      entity.isActive,
      entity.marketId,
      entity.createdAt,
      entity.updatedAt,
      entity.guides,
    );
  }
}
