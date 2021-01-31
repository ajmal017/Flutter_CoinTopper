import 'package:equatable/equatable.dart';

class SearchCoinListEntity extends Equatable {
  final String value;
  final String id;
  final String color1;
  final String color2;
  final String logo;
  final String url;
  final int coinid;
  final int marketId;

  SearchCoinListEntity(
    this.value,
    this.id,
    this.color1,
    this.color2,
    this.logo,
    this.url,
    this.coinid,
    this.marketId,
  );

  @override
  List<Object> get props => [
        value,
        id,
        color1,
        color2,
        logo,
        url,
        coinid,
        marketId,
      ];

  Map<String, Object> toJson() {
    return {
      "value": value,
      "id": id,
      "color1": color1,
      "color2": color2,
      "logo": logo,
      "url": url,
      "coinid": coinid,
      "market_id": marketId,
    };
  }

  static SearchCoinListEntity fromJson(Map<String, Object> json) {
    return SearchCoinListEntity(
        json['value'] as String,
        json['id'] as String,
        json['color1'] as String,
        json['color2'] as String,
        json['logo'] as String,
        json['url'] as String,
        json['coinid'] as int,
        json['market_id'] as int);
  }
}
