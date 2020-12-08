import 'package:cointopper/models/globalDataCoin_response_model.dart';
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

//// Currency List DropDown
//class CurrencyListLoadSuccess extends DashboardState {
//  final List<CurrencyListResponseModel> currencyList;
//
//  CurrencyListLoadSuccess([this.currencyList = const []]);
//
//  @override
//  List<Object> get props => [currencyList];
//}
//
////Top Viewed Coin List Event
//class TopViewedCoinListLoadInProgress extends DashboardState {}
//
//class TopViewedCoinListLoadSuccess extends DashboardState {
//  final List<TopViewedCoinListResponseModel> topViewedCoinList;
//
//  TopViewedCoinListLoadSuccess([this.topViewedCoinList = const []]);
//
//  @override
//  List<Object> get props => [topViewedCoinList];
//}
//
//class TopViewedCoinListLoadFailure extends DashboardState {}
