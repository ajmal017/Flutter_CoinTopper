import 'package:cointopper/models/coin_detail_response_model.dart';
import 'package:equatable/equatable.dart';

abstract class CoinDetailState extends Equatable {
  const CoinDetailState();

  @override
  List<Object> get props => [];
}

class CoinDetailLoadInProgress extends CoinDetailState {}

class CoinDetailLoadSuccess extends CoinDetailState {
  final List<CoinDetailResponseModel> coinDetail;

  CoinDetailLoadSuccess(this.coinDetail);

  @override
  List<Object> get props => [coinDetail];
}

class CoinDetailLoadFailure extends CoinDetailState {}
