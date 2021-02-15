import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cointopper/bloc/coin_list_bloc/coin_list_event.dart';
import 'package:cointopper/bloc/coin_list_bloc/coin_list_state.dart';
import 'package:cointopper/repositories/repo.dart';
import 'package:meta/meta.dart';

class CoinListBloc extends Bloc<CoinListEvent, CoinListState> {
  final CoinTopperRepository coinTopperRepository;
  StreamSubscription _coinListSubscription;

  CoinListBloc({@required this.coinTopperRepository})
      : super(CoinListLoadInProgress());

  @override
  Stream<CoinListState> mapEventToState(CoinListEvent event) async* {
    if (event is LoadCoinList) {
      yield* _mapLoadCoinListState(event.currencyCode, event.offset, event.limit);
    }
    {
      if (event is UpdateCoinList) {
        yield* _mapUpdateCoinListState(event);
      }
    }
  }

  Stream<CoinListState> _mapLoadCoinListState(String currencyCode, int offset, int limit) async* {
    _coinListSubscription?.cancel();
    _coinListSubscription = coinTopperRepository.loadCoinList(currencyCode, offset, limit).listen(
          (list) => add(UpdateCoinList(list)),
        );
  }

  Stream<CoinListState> _mapUpdateCoinListState(
      UpdateCoinList event) async* {
    yield CoinListLoadSuccess(event.coinList);
  }

  @override
  Future<void> close() {
    _coinListSubscription?.cancel();
    return super.close();
  }
}
