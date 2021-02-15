import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cointopper/bloc/search_coin_bloc/searchCoinList_event.dart';
import 'package:cointopper/bloc/search_coin_bloc/searchCoinList_state.dart';
import 'package:cointopper/repositories/repo.dart';
import 'package:meta/meta.dart';

class SearchCoinListBloc
    extends Bloc<SearchCoinListEvent, SearchCoinListState> {
  final CoinTopperRepository coinTopperRepository;
  StreamSubscription _searchCoinSubscription;

  SearchCoinListBloc({@required this.coinTopperRepository})
      : super(SearchCoinListLoadInProgress());

  @override
  Stream<SearchCoinListState> mapEventToState(
      SearchCoinListEvent event) async* {
    if (event is LoadSearchCoinList) {
      yield* _mapLoadSearchCoinState();
    }
    {
      if (event is UpdateSearchCoinList) {
        yield* _mapUpdateSearchCoinState(event);
      }
    }
  }

  Stream<SearchCoinListState> _mapLoadSearchCoinState() async* {
    _searchCoinSubscription?.cancel();
    _searchCoinSubscription = coinTopperRepository.loadSearchCoinsList().listen(
          (list) => add(UpdateSearchCoinList(list)),
        );
  }

  Stream<SearchCoinListState> _mapUpdateSearchCoinState(
      UpdateSearchCoinList event) async* {
    yield SearchCoinListLoadSuccess(event.searchCoinList);
  }

  @override
  Future<void> close() {
    _searchCoinSubscription?.cancel();
    return super.close();
  }
}
