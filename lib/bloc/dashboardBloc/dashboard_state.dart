import 'package:cointopper/models/globalDataCoin_response_model.dart';
import 'package:cointopper/models/topViewedCoinList_response_Model.dart';
import 'package:equatable/equatable.dart';

abstract class DashboardState extends Equatable {
  const DashboardState();

  @override
  List<Object> get props => [];
}

class DashboardLoadInProgress extends DashboardState {}

class DashboardLoadSuccess extends DashboardState {
  final List<GlobalDataCoinResponseModel> globalDataCoin;

  DashboardLoadSuccess(this.globalDataCoin);

  @override
  List<Object> get props => [globalDataCoin];
}

class DashboardLoadFailure extends DashboardState {}

//Top Viewed Coin List Event
class TopViewedCoinListLoadInProgress extends DashboardState {}

class TopViewedCoinListLoadSuccess extends DashboardState {
  final List<TopViewedCoinListResponseModel> topViewedCoinList;

  const TopViewedCoinListLoadSuccess([this.topViewedCoinList = const []]);

  @override
  List<Object> get props => [topViewedCoinList];
}

class TopViewedCoinListLoadFailure extends DashboardState {}
