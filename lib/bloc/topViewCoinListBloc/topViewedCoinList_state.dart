import 'package:cointopper/models/topViewedCoinList_response_Model.dart';
import 'package:equatable/equatable.dart';

abstract class TopViewedCoinListState extends Equatable {
  const  TopViewedCoinListState();

  @override
  List<Object> get props => [];
}

class TopViewedCoinListLoadInProgress extends TopViewedCoinListState {}

class TopViewedCoinListLoadSuccess extends TopViewedCoinListState {
  final List<TopViewedCoinListResponseModel> topCoinsList;

  const TopViewedCoinListLoadSuccess([this.topCoinsList = const []]);

  @override
  List<Object> get props => [topCoinsList];
}

class  TopViewedCoinListLoadFailure extends TopViewedCoinListState {}
