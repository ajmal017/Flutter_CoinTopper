import 'dart:async';

import 'package:cointopper/bloc/dashboardBloc/dashboard_event.dart';
import 'package:cointopper/bloc/dashboardBloc/dashboard_state.dart';
import 'package:cointopper/repositories/repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final CoinTopperRepository coinTopperRepository;
  StreamSubscription _dashboardSubscription;

  DashboardBloc({@required this.coinTopperRepository})
      : super(DashboardLoadInProgress());

  @override
  Stream<DashboardState> mapEventToState(DashboardEvent event) async* {
    if (event is LoadGlobalDataCoin) {
      print('mapEventToState LoadGlobalDataCoin ==>> if');
      yield* _mapLoadDashboardState();
    }

    if (event is UpdateGlobalDataCoin) {
      print('mapEventToState UpdateGlobalDataCoin ==>> if');
      yield* _mapUpdateDashboardState(event);
    }

    if (event is LoadTopViewedCoinList) {
      print('mapEventToState TopViewedCoinList ==>> if');
      yield* _mapLoadTopCoinsListState();
    }
    if (event is UpdateTopViewedCoinList) {
      print('mapEventToState TopViewedCoinList ==>> else');
      yield* _mapUpdateTopCoinsListState(event);
    }
  }

  Stream<DashboardState> _mapLoadDashboardState() async* {
    print('_mapLoadDashboardState TopViewedCoinList ==>> ');
    _dashboardSubscription?.cancel();
    _dashboardSubscription = coinTopperRepository.loadGlobalDataCoin().listen(
          (list) => add(UpdateGlobalDataCoin(list)),
        );
  }

  Stream<DashboardState> _mapUpdateDashboardState(
      UpdateGlobalDataCoin event) async* {
    print('_mapUpdateDashboardState TopViewedCoinList ==>> ');
    yield DashboardLoadSuccess(event.globalDataCoin);
  }

  Stream<DashboardState> _mapLoadTopCoinsListState() async* {
    print('_mapLoadTopCoinsListState TopViewedCoinList ==>> ');
    _dashboardSubscription?.cancel();
    _dashboardSubscription =
        coinTopperRepository.loadTopViewedCoinList().listen(
              (list) => add(UpdateTopViewedCoinList(list)),
            );
  }

  Stream<DashboardState> _mapUpdateTopCoinsListState(
      UpdateTopViewedCoinList event) async* {
    print('_mapUpdateTopCoinsListState TopViewedCoinList ==>> ');
    yield TopViewedCoinListLoadSuccess(event.topViewedCoinList);
  }

  @override
  Future<void> close() {
    _dashboardSubscription?.cancel();
    return super.close();
  }
}
