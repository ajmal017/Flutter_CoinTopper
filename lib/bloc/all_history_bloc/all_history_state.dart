import 'package:cointopper/models/all_history_api_response_model.dart';
import 'package:equatable/equatable.dart';

abstract class AllHistoryState extends Equatable {
  const AllHistoryState();

  @override
  List<Object> get props => [];
}

class AllHistoryLoadInProgress extends AllHistoryState {}

class AllHistoryLoadSuccess extends AllHistoryState {
  final List<AllHistoryApiResponseModel> allHistory;

  AllHistoryLoadSuccess(this.allHistory);

  @override
  List<Object> get props => [allHistory];
}

class AllHistoryLoadFailure extends AllHistoryState {}
