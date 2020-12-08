import 'package:cointopper/models/coinList_response_model.dart';
import 'package:equatable/equatable.dart';

abstract class CoinListEvent extends Equatable {
  const CoinListEvent();

  @override
  List<Object> get props => [];
}

class LoadCoinList extends CoinListEvent {}

class UpdateCoinList extends CoinListEvent {
  final List<CoinListResponseModel> coinList;

  const UpdateCoinList(this.coinList);

  @override
  List<Object> get props => [coinList];
}
