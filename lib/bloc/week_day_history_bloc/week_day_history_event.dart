import 'package:cointopper/models/week_day_history_api_response_model.dart';
import 'package:equatable/equatable.dart';

abstract class WeekDayHistoryEvent extends Equatable {
  const WeekDayHistoryEvent();

  @override
  List<Object> get props => [];
}

class LoadWeekDayHistory extends WeekDayHistoryEvent {
  final int marketId;

  const LoadWeekDayHistory(this.marketId);

  @override
  List<int> get props => [marketId];
}

class UpdateWeekDayHistory extends WeekDayHistoryEvent {
  final List<WeekDayHistoryApiResponseModel> weekDayHistory;

  const UpdateWeekDayHistory(this.weekDayHistory);

  @override
  List<Object> get props => [weekDayHistory];
}
