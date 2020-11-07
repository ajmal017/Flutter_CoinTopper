import 'package:cointopper/entities/topViewedCoinList_data_entity.dart';
import 'package:meta/meta.dart';

@immutable
class TopViewedCoinListResponseModel {
  final double percent_change24h;
  final String logo;
  final double price_btc;
  final double price;
  final String symbol;
  final String name;
  final String color1;
  final String color2;

  TopViewedCoinListResponseModel(this.percent_change24h, this.logo, this.price_btc, this.price,
      this.symbol, this.name, this.color1, this.color2);

  TopViewedCoinListEntity toEntity() {
    return TopViewedCoinListEntity(percent_change24h, logo, price_btc, price, symbol,
        name, color1, color2);
  }

  static TopViewedCoinListResponseModel fromEntity(TopViewedCoinListEntity entity) {
    return TopViewedCoinListResponseModel(entity.percent_change24h, entity.logo, entity.price_btc,
        entity.price, entity.symbol, entity.name, entity.color1, entity.color2);
  }
}
