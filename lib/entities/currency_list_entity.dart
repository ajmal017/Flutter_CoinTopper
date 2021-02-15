import 'package:equatable/equatable.dart';

class CurrencyListEntity extends Equatable {
  final int id;
  final String name;
  final String code;
  final String symbol;
  final String format;
  final String exchangeRate;
  final int active;
  final String createdAt;
  final String updatedAt;

  CurrencyListEntity(
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

  @override
  List<Object> get props => [
    id,
    name,
    code,
    symbol,
    format,
    exchangeRate,
    active,
    createdAt,
    updatedAt,
      ];

  Map<String, Object> toJson() {
    return {
      'id': id,
      'name': name,
      'code': code,
      'symbol': symbol,
      'format': format,
      'exchange_rate': exchangeRate,
      'active': active,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  static CurrencyListEntity fromJson(Map<String, Object> json) {
    return CurrencyListEntity(
      json['id'] as int,
      json['name'] as String,
      json['code'] as String,
      json['symbol'] as String,
      json['format'] as String,
      json['exchange_rate'] as String,
      json['active'] as int,
      json['created_at'] as String,
      json['updated_at'] as String,
    );
  }
}
