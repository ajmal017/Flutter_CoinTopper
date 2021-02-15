import 'package:cointopper/models/coin_list_response_model.dart';
import 'package:equatable/equatable.dart';

abstract class CoinListEvent extends Equatable {
  const CoinListEvent();

  @override
  List<Object> get props => [];
}

class LoadCoinList extends CoinListEvent {
  final String currencyCode;
  final int offset;
  final int limit;

  const LoadCoinList(this.currencyCode, this.offset, this.limit);

  @override
  List<String> get props => [currencyCode];
}

class UpdateCoinList extends CoinListEvent {
  final List<CoinListResponseModel> coinList;

  const UpdateCoinList(this.coinList);

  @override
  List<Object> get props => [coinList];
}
