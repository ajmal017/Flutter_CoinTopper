import 'package:cointopper/models/topViewedCoinList_response_Model.dart';
import 'package:equatable/equatable.dart';

abstract class TopViewedCoinListEvent extends Equatable {
  const TopViewedCoinListEvent();

  @override
  List<Object> get props => [];
}

class LoadTopViewedCoinList extends TopViewedCoinListEvent {
  final String currencyCode;

  const LoadTopViewedCoinList(this.currencyCode);

  @override
  List<String> get props => [currencyCode];
}

class UpdateTopViewedCoinList extends TopViewedCoinListEvent {
  final List<TopViewedCoinListResponseModel> topViewedCoinList;

  const UpdateTopViewedCoinList(this.topViewedCoinList);

  @override
  List<Object> get props => [topViewedCoinList];
}
