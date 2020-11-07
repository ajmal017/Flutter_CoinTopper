import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cointopper/bloc/topViewCoinListBloc/topViewedCoinList_event.dart';
import 'package:cointopper/bloc/topViewCoinListBloc/topViewedCoinList_state.dart';
import 'package:cointopper/repositories/repo.dart';
import 'package:meta/meta.dart';

class TopViewedCoinListBloc
    extends Bloc<TopViewedCoinListEvent, TopViewedCoinListState> {
  final CoinTopperRepository coinRepository;
  StreamSubscription _coinSubscription;

  TopViewedCoinListBloc({@required this.coinRepository})
      : super(TopViewedCoinListLoadInProgress());

  @override
  Stream<TopViewedCoinListState> mapEventToState(
      TopViewedCoinListEvent event) async* {
    print('mapEventToState TopViewedCoinList ==>> ');
    if (event is LoadTopViewedCoinList) {
      print('mapEventToState TopViewedCoinList ==>> if');
      yield* _mapLoadTopCoinsListState();
    }
    if (event is UpdateTopViewedCoinList) {
      print('mapEventToState TopViewedCoinList ==>> else');
      yield* _mapUpdateTopCoinsListState(event);
    }
  }

  Stream<TopViewedCoinListState> _mapLoadTopCoinsListState() async* {
    print('_mapLoadTopCoinsListState TopViewedCoinList ==>> ');
    _coinSubscription?.cancel();
    _coinSubscription = coinRepository.loadTopViewedCoinList().listen(
          (list) => add(UpdateTopViewedCoinList(list)),
        );
  }

  Stream<TopViewedCoinListState> _mapUpdateTopCoinsListState(
      UpdateTopViewedCoinList event) async* {
    print('_mapUpdateTopCoinsListState TopViewedCoinList ==>> ');
    yield TopViewedCoinListLoadSuccess(event.topViewedCoinList);
  }

  @override
  Future<void> close() {
    _coinSubscription?.cancel();
    return super.close();
  }
}
