import 'dart:async';

import 'package:cointopper/bloc/dashboard_bloc/dashboard_event.dart';
import 'package:cointopper/bloc/dashboard_bloc/dashboard_state.dart';
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
      yield* _mapLoadDashboardState();
    }

    {
      if (event is UpdateGlobalDataCoin) {
        yield* _mapUpdateDashboardState(event);
      }

//      if (event is UpdateCurrencyList) {
//        yield* _mapUpdateCurrencyListState(event);
//      }
//
//      if (event is UpdateTopViewedCoinList) {
//        yield* _mapUpdateTopCoinsListState(event);
//      }
    }
  }

  Stream<DashboardState> _mapLoadDashboardState() async* {
    _dashboardSubscription?.cancel();
    _dashboardSubscription = coinTopperRepository.loadGlobalDataCoin().listen(
          (list) => add(UpdateGlobalDataCoin(list)),
        );

//    _dashboardSubscription = coinTopperRepository.loadCurrencyList().listen(
//          (list) => add(UpdateCurrencyList(list)),
//        );
//
//    _dashboardSubscription =
//        coinTopperRepository.loadTopViewedCoinList().listen(
//              (list) => add(UpdateTopViewedCoinList(list)),
//            );
  }

  Stream<DashboardState> _mapUpdateDashboardState(
      UpdateGlobalDataCoin event) async* {
    yield DashboardLoadSuccess(event.globalDataCoin);
  }

//  Stream<DashboardState> _mapUpdateCurrencyListState(
//      UpdateCurrencyList event) async* {
//    print("entered");
//    yield CurrencyListLoadSuccess(event.currencyList);
//  }
//
//  Stream<DashboardState> _mapUpdateTopCoinsListState(
//      UpdateTopViewedCoinList event) async* {
//    yield TopViewedCoinListLoadSuccess(event.topViewedCoinList);
//  }

  @override
  Future<void> close() {
    _dashboardSubscription?.cancel();
    return super.close();
  }
}
