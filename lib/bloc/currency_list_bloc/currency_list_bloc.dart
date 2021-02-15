import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cointopper/bloc/currency_list_bloc/currency_list_event.dart';
import 'package:cointopper/bloc/currency_list_bloc/currency_list_state.dart';
import 'package:cointopper/repositories/repo.dart';
import 'package:meta/meta.dart';

class CurrencyListBloc extends Bloc<CurrencyListEvent, CurrencyListState> {
  final CoinTopperRepository coinTopperRepository;
  StreamSubscription _currencyListSubscription;

  CurrencyListBloc({@required this.coinTopperRepository})
      : super(CurrencyListLoadInProgress());

  @override
  Stream<CurrencyListState> mapEventToState(CurrencyListEvent event) async* {
    if (event is LoadCurrencyList) {
      yield* _mapLoadCurrencyListState();
    }
    {
      if (event is UpdateCurrencyList) {
        yield* _mapUpdateCurrencyListState(event);
      }
    }
  }

  Stream<CurrencyListState> _mapLoadCurrencyListState() async* {
    _currencyListSubscription?.cancel();
    _currencyListSubscription = coinTopperRepository.loadCurrencyList().listen(
          (list) => add(UpdateCurrencyList(list)),
        );
  }

  Stream<CurrencyListState> _mapUpdateCurrencyListState(
      UpdateCurrencyList event) async* {
    yield CurrencyListLoadSuccess(event.currencyList);
  }

  @override
  Future<void> close() {
    _currencyListSubscription?.cancel();
    return super.close();
  }
}
