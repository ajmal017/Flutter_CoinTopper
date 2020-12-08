import 'package:equatable/equatable.dart';

class CurrencyListEntity extends Equatable {
  final int id;
  final String name;
  final String code;
  final String symbol;
  final String format;
  final String exchange_rate;
  final int active;
  final String created_at;
  final String updated_at;

  CurrencyListEntity(
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

  @override
  List<Object> get props => [
        id,
        name,
        code,
        symbol,
        format,
        exchange_rate,
        active,
        created_at,
        updated_at,
      ];

  Map<String, Object> toJson() {
    return {
      'id': id,
      'name': name,
      'code': code,
      'symbol': symbol,
      'format': format,
      'exchange_rate': exchange_rate,
      'active': active,
      'created_at': created_at,
      'updated_at': updated_at,
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
