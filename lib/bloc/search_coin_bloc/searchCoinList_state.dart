import 'package:cointopper/models/search_coin_response_model.dart';
import 'package:equatable/equatable.dart';

abstract class SearchCoinListState extends Equatable {
  const SearchCoinListState();

  @override
  List<Object> get props => [];
}

class SearchCoinListLoadInProgress extends SearchCoinListState {}

class SearchCoinListLoadSuccess extends SearchCoinListState {
  final List<SearchCoinListResponseModel> searchCoinList;

  const SearchCoinListLoadSuccess(this.searchCoinList);

  @override
  List<Object> get props => [searchCoinList];
}

class SearchCoinListLoadFailure extends SearchCoinListState {}
