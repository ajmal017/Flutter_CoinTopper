import 'package:cointopper/models/global_data_coin_response_model.dart';
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