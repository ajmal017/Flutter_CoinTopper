import 'package:cointopper/models/currencyList_response_model.dart';
import 'package:cointopper/models/globalDataCoin_response_model.dart';
import 'package:cointopper/models/topViewedCoinList_response_Model.dart';
import 'package:equatable/equatable.dart';

abstract class DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  List<Object> get props => [];
}

class LoadGlobalDataCoin extends DashboardEvent {}

class UpdateGlobalDataCoin extends DashboardEvent {
  final List<GlobalDataCoinResponseModel> globalDataCoin;

  const UpdateGlobalDataCoin(this.globalDataCoin);

  @override
  List<Object> get props => [globalDataCoin];
}

// Currency List DropDown
class UpdateCurrencyList extends DashboardEvent {
  final List<CurrencyListResponseModel> currencyList;

  const UpdateCurrencyList(this.currencyList);

  @override
  List<Object> get props => [currencyList];
}

//Top Viewed Coin List State
class LoadTopViewedCoinList extends DashboardEvent {}

class UpdateTopViewedCoinList extends DashboardEvent {
  final List<TopViewedCoinListResponseModel> topViewedCoinList;

  const UpdateTopViewedCoinList(this.topViewedCoinList);

  @override
  List<Object> get props => [topViewedCoinList];
}
