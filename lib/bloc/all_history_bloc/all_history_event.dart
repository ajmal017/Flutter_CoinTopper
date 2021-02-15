import 'package:cointopper/models/all_history_api_response_model.dart';
import 'package:equatable/equatable.dart';

abstract class AllHistoryEvent extends Equatable {
  const AllHistoryEvent();

  @override
  List<Object> get props => [];
}

class LoadAllHistory extends AllHistoryEvent {
  final int marketId;

  const LoadAllHistory(this.marketId);

  @override
  List<int> get props => [marketId];
}

class UpdateAllHistory extends AllHistoryEvent {
  final List<AllHistoryApiResponseModel> allHistory;

  const UpdateAllHistory(this.allHistory);

  @override
  List<Object> get props => [allHistory];
}
