import 'package:cointopper/models/coin_list_response_model.dart';
import 'package:equatable/equatable.dart';

abstract class CoinListState extends Equatable {
  const CoinListState();

  @override
  List<Object> get props => [];
}

class CoinListLoadInProgress extends CoinListState {}

class CoinListLoadSuccess extends CoinListState {
  final List<CoinListResponseModel> coinList;

  CoinListLoadSuccess(this.coinList);

  @override
  List<Object> get props => [coinList];
}

class CoinListLoadFailure extends CoinListState {}
