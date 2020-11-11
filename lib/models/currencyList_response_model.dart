import 'package:cointopper/entities/currencyList_entity.dart';
import 'package:meta/meta.dart';

@immutable
class CurrencyListResponseModel {
  final double id;
  final String name;
  final String code;
  final String symbol;
  final String format;
  final String exchange_rate;
  final double active;
  final String created_at;
  final String updated_at;

  CurrencyListResponseModel(
    this.id,
    this.name,
    this.code,
    this.symbol,
    this.format,
    this.exchange_rate,
    this.active,
    this.created_at,
    this.updated_at,
  );

  CurrencyListEntity toEntity() {
    return CurrencyListEntity(
      id,
      name,
      code,
      symbol,
      format,
      exchange_rate,
      active,
      created_at,
      updated_at,
    );
  }

  static CurrencyListResponseModel fromEntity(CurrencyListEntity entity) {
    return CurrencyListResponseModel(
      entity.id,
      entity.name,
      entity.code,
      entity.symbol,
      entity.format,
      entity.exchange_rate,
      entity.active,
      entity.created_at,
      entity.updated_at,
    );
  }
}
