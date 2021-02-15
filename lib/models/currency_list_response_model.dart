import 'package:cointopper/entities/currency_list_entity.dart';
import 'package:meta/meta.dart';

@immutable
class CurrencyListResponseModel {
  final int id;
  final String name;
  final String code;
  final String symbol;
  final String format;
  final String exchangeRate;
  final int active;
  final String createdAt;
  final String updatedAt;

  CurrencyListResponseModel(
    this.id,
    this.name,
    this.code,
    this.symbol,
    this.format,
    this.exchangeRate,
    this.active,
    this.createdAt,
    this.updatedAt,
  );

  CurrencyListEntity toEntity() {
    return CurrencyListEntity(
      id,
      name,
      code,
      symbol,
      format,
      exchangeRate,
      active,
      createdAt,
      updatedAt,
    );
  }

  static CurrencyListResponseModel fromEntity(CurrencyListEntity entity) {
    return CurrencyListResponseModel(
      entity.id,
      entity.name,
      entity.code,
      entity.symbol,
      entity.format,
      entity.exchangeRate,
      entity.active,
      entity.createdAt,
      entity.updatedAt,
    );
  }
}
