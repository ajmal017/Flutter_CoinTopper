import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cointopper/bloc/all_history_bloc/all_history_event.dart';
import 'package:cointopper/bloc/all_history_bloc/all_history_state.dart';
import 'package:cointopper/repositories/repo.dart';
import 'package:meta/meta.dart';

class AllHistoryBloc extends Bloc<AllHistoryEvent, AllHistoryState> {
  final CoinTopperRepository coinTopperRepository;
  StreamSubscription _allHistorySubscription;

  AllHistoryBloc({@required this.coinTopperRepository})
      : super(AllHistoryLoadInProgress());

  @override
  Stream<AllHistoryState> mapEventToState(AllHistoryEvent event) async* {
    if (event is LoadAllHistory) {
      yield* _mapLoadAllHistoryState(event.marketId);
    }
    {
      if (event is UpdateAllHistory) {
        yield* _mapUpdateAllHistoryState(event);
      }
    }
  }

  Stream<AllHistoryState> _mapLoadAllHistoryState(marketId) async* {
    _allHistorySubscription?.cancel();
    _allHistorySubscription =
        coinTopperRepository.loadAllHistoryApi(marketId).listen(
              (list) => add(UpdateAllHistory(list)),
            );
  }

  Stream<AllHistoryState> _mapUpdateAllHistoryState(
      UpdateAllHistory event) async* {
    yield AllHistoryLoadSuccess(event.allHistory);
  }

  @override
  Future<void> close() {
    _allHistorySubscription?.cancel();
    return super.close();
  }
}
