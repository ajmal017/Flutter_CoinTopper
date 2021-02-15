import 'package:equatable/equatable.dart';

class AllHistoryApiEntity extends Equatable {
  final dynamic marketCap;
  final dynamic btcPrice;
  final dynamic price;
  final dynamic totalSupply;
  final dynamic maxSupply;
  final dynamic volume24h;
  final dynamic circulatingSupply;
  final int time;

  AllHistoryApiEntity(
    this.marketCap,
    this.btcPrice,
    this.price,
    this.totalSupply,
    this.maxSupply,
    this.volume24h,
    this.circulatingSupply,
    this.time,
  );

  @override
  List<Object> get props => [
        marketCap,
        btcPrice,
        price,
        totalSupply,
        maxSupply,
        volume24h,
        circulatingSupply,
        time,
      ];

  Map<String, Object> toJson() {
    return {
      "market_cap": marketCap,
      "btc_price": btcPrice,
      "price": price,
      "total_supply": totalSupply,
      "max_supply": maxSupply,
      "volume_24h": volume24h,
      "circulating_supply": circulatingSupply,
      "time": time,
    };
  }

  static AllHistoryApiEntity fromJson(Map<String, Object> json) {
    return AllHistoryApiEntity(
      json["market_cap"] as dynamic,
      json["btc_price"] as dynamic,
      json["price"] as dynamic,
      json["total_supply"] as dynamic,
      json["max_supply"] as dynamic,
      json["volume_24h"] as dynamic,
      json["circulating_supply"] as dynamic,
      json["time"] as int,
    );
  }
}
