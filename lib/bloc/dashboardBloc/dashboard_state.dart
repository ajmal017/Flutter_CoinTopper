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

//  const DashboardtLoadSuccess([this.globalDataCoin = const []]);

  @override
  List<Object> get props => [globalDataCoin];
}

class DashboardLoadFailure extends DashboardState {}
