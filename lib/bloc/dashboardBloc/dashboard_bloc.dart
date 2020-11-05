import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cointopper/bloc/dashboardBloc/dashboard_event.dart';
import 'package:cointopper/bloc/dashboardBloc/dashboard_state.dart';
import 'package:cointopper/repositories/repo.dart';
import 'package:meta/meta.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final CoinTopperRepository coinTopperRepository;
  StreamSubscription _dashboardSubscription;

  DashboardBloc({@required this.coinTopperRepository})
      : super(DashboardLoadInProgress());

  @override
  Stream<DashboardState> mapEventToState(DashboardEvent event) async* {
    print('mapEventToState ==>> ');
    if (event is LoadGlobalDataCoin) {
      print('LoadGlobalDataCoin ==>> event');
      yield* _mapLoadDashboardState();
    }
    if (event is UpdateGlobalDataCoin) {
      print('UpdateGlobalDataCoin ==>> event');
      yield* _mapUpdateDashboardState(event);
    }
  }

  Stream<DashboardState> _mapLoadDashboardState() async* {
    print("_mapLoadDashboardState func ==>>");
    _dashboardSubscription?.cancel();
    _dashboardSubscription = coinTopperRepository.loadGlobalDataCoin().listen(
          (list) => add(UpdateGlobalDataCoin(list)),
        );
  }

  Stream<DashboardState> _mapUpdateDashboardState(
      UpdateGlobalDataCoin event) async* {
    print(' event.globalDataCoin ==>> ${event.globalDataCoin}');
    yield DashboardLoadSuccess(event.globalDataCoin);
  }

  @override
  Future<void> close() {
    _dashboardSubscription?.cancel();
    return super.close();
  }
}
