import 'package:cointopper/models/global_data_coin_response_model.dart';
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