import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cointopper/bloc/top_view_coin_list_bloc/top_viewed_coin_list_event.dart';
import 'package:cointopper/bloc/top_view_coin_list_bloc/top_viewed_coin_list_state.dart';
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
    if (event is LoadTopViewedCoinList) {
      yield* _mapLoadTopCoinsListState(event.currencyCode);
    }
    if (event is UpdateTopViewedCoinList) {
      yield* _mapUpdateTopCoinsListState(event);
    }
  }

  Stream<TopViewedCoinListState> _mapLoadTopCoinsListState(
      String currencyCode) async* {
    _coinSubscription?.cancel();
    _coinSubscription =
        coinRepository.loadTopViewedCoinList(currencyCode).listen(
              (list) => add(UpdateTopViewedCoinList(list)),
            );
  }

  Stream<TopViewedCoinListState> _mapUpdateTopCoinsListState(
      UpdateTopViewedCoinList event) async* {
    yield TopViewedCoinListLoadSuccess(event.topViewedCoinList);
  }

  @override
  Future<void> close() {
    _coinSubscription?.cancel();
    return super.close();
  }
}
