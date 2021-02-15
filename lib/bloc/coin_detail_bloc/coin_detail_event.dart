import 'package:cointopper/models/coin_detail_response_model.dart';
import 'package:equatable/equatable.dart';

abstract class CoinDetailEvent extends Equatable {
  const CoinDetailEvent();

  @override
  List<Object> get props => [];
}

class LoadCoinDetail extends CoinDetailEvent {
  final String symbol;
  final String currencyCode;

  const LoadCoinDetail(this.symbol, this.currencyCode);

  @override
  List<String> get props => [symbol, currencyCode];
}

class UpdateCoinDetail extends CoinDetailEvent {
  final List<CoinDetailResponseModel> coinDetail;

  const UpdateCoinDetail(this.coinDetail);

  @override
  List<Object> get props => [coinDetail];
}
