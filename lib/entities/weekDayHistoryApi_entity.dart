import 'package:equatable/equatable.dart';

class WeekDayHistoryApiEntity extends Equatable {
  final double marketCap;
  final String btcPrice;
  final double percentChange7d;
  final double price;
  final double percentChange24h;
  final double totalSupply;
  final int maxSupply;
  final double volume_24h;
  final double circulatingSupply;
  final int time;
  final double percentChange1h;

  WeekDayHistoryApiEntity(
      this.marketCap,
      this.btcPrice,
      this.percentChange7d,
      this.price,
      this.percentChange24h,
      this.totalSupply,
      this.maxSupply,
      this.volume_24h,
      this.circulatingSupply,
      this.time,
      this.percentChange1h,
  );

  @override
  List<Object> get props => [
    marketCap,
    btcPrice,
    percentChange7d,
    price,
    percentChange24h,
    totalSupply,
    maxSupply,
    volume_24h,
    circulatingSupply,
    time,
    percentChange1h,
      ];

  Map<String, Object> toJson() {
    return {
      "market_cap": marketCap,
      "btc_price": btcPrice,
      "percent_change_7d": percentChange7d,
      "price": price,
      "percent_change_24h": percentChange24h,
      "total_supply": totalSupply,
      "max_supply": maxSupply,
      "volume_24h": volume_24h,
      "circulating_supply": circulatingSupply,
      "time": time,
      "percent_change_1h": percentChange1h,
    };
  }

  static WeekDayHistoryApiEntity fromJson(Map<String, Object> json) {
    return WeekDayHistoryApiEntity(
      json["market_cap"] as double,
      json["btc_price"] as String,
      json["percent_change_7d"] as double,
      json["price"] as double,
      json["percent_change_24h"] as double,
      json["total_supply"] as double,
      json["max_supply"] as int,
      json["volume_24h"] as double,
      json["circulating_supply"] as double,
      json["time"] as int,
      json["percent_change_1h"] as double,
    );
  }
}
