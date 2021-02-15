import 'package:cointopper/models/week_day_history_api_response_model.dart';
import 'package:equatable/equatable.dart';

abstract class WeekDayHistoryState extends Equatable {
  const WeekDayHistoryState();

  @override
  List<Object> get props => [];
}

class WeekDayHistoryLoadInProgress extends WeekDayHistoryState {}

class WeekDayHistoryLoadSuccess extends WeekDayHistoryState {
  final List<WeekDayHistoryApiResponseModel> weekDayHistory;

  WeekDayHistoryLoadSuccess(this.weekDayHistory);

  @override
  List<Object> get props => [weekDayHistory];
}

class WeekDayHistoryLoadFailure extends WeekDayHistoryState {}
