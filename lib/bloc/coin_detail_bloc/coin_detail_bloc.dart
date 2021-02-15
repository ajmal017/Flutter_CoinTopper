import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cointopper/bloc/coin_detail_bloc/coin_detail_event.dart';
import 'package:cointopper/bloc/coin_detail_bloc/coin_detail_state.dart';
import 'package:cointopper/repositories/repo.dart';
import 'package:meta/meta.dart';

class CoinDetailBloc extends Bloc<CoinDetailEvent, CoinDetailState> {
  final CoinTopperRepository coinTopperRepository;
  StreamSubscription _coinDetailSubscription;

  CoinDetailBloc({@required this.coinTopperRepository})
      : super(CoinDetailLoadInProgress());

  @override
  Stream<CoinDetailState> mapEventToState(CoinDetailEvent event) async* {
    if (event is LoadCoinDetail) {
      yield* _mapLoadCoinDetailState(event.symbol, event.currencyCode);
    }
    {
      if (event is UpdateCoinDetail) {
        yield* _mapUpdateCoinDetailState(event);
      }
    }
  }

  Stream<CoinDetailState> _mapLoadCoinDetailState(String symbol, String currencyCode) async* {
    _coinDetailSubscription?.cancel();
    _coinDetailSubscription =
        coinTopperRepository.loadCoinDetailsList(symbol, currencyCode).listen(
              (list) => add(UpdateCoinDetail(list)),
            );
  }

  Stream<CoinDetailState> _mapUpdateCoinDetailState(
      UpdateCoinDetail event) async* {
    yield CoinDetailLoadSuccess(event.coinDetail);
  }

  @override
  Future<void> close() {
    _coinDetailSubscription?.cancel();
    return super.close();
  }
}
