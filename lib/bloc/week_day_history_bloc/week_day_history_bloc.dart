import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cointopper/bloc/week_day_history_bloc/week_day_history_event.dart';
import 'package:cointopper/bloc/week_day_history_bloc/week_day_history_state.dart';
import 'package:cointopper/repositories/repo.dart';
import 'package:meta/meta.dart';

class WeekDayHistoryBloc
    extends Bloc<WeekDayHistoryEvent, WeekDayHistoryState> {
  final CoinTopperRepository coinTopperRepository;
  StreamSubscription _weekDayHistorySubscription;

  WeekDayHistoryBloc({@required this.coinTopperRepository})
      : super(WeekDayHistoryLoadInProgress());

  @override
  Stream<WeekDayHistoryState> mapEventToState(
      WeekDayHistoryEvent event) async* {
    if (event is LoadWeekDayHistory) {
      yield* _mapLoadWeekDayHistoryState(event.marketId);
    }
    {
      if (event is UpdateWeekDayHistory) {
        yield* _mapUpdateWeekDayHistoryState(event);
      }
    }
  }

  Stream<WeekDayHistoryState> _mapLoadWeekDayHistoryState(marketId) async* {
    _weekDayHistorySubscription?.cancel();
    _weekDayHistorySubscription =
        coinTopperRepository.loadWeekDayHistoryApi(marketId).listen(
              (list) => add(UpdateWeekDayHistory(list)),
            );
  }

  Stream<WeekDayHistoryState> _mapUpdateWeekDayHistoryState(
      UpdateWeekDayHistory event) async* {
    yield WeekDayHistoryLoadSuccess(event.weekDayHistory);
  }

  @override
  Future<void> close() {
    _weekDayHistorySubscription?.cancel();
    return super.close();
  }
}
