import 'package:cointopper/models/searchCoin_response_model.dart';
import 'package:equatable/equatable.dart';

abstract class SearchCoinListEvent extends Equatable {
  const SearchCoinListEvent();

  @override
  List<Object> get props => [];
}

class LoadSearchCoinList extends SearchCoinListEvent {}

class UpdateSearchCoinList extends SearchCoinListEvent {
  final List<SearchCoinListResponseModel> searchCoinList;

  const UpdateSearchCoinList(this.searchCoinList);

  @override
  List<Object> get props => [searchCoinList];
}
