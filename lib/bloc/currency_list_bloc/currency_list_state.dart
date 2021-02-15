import 'package:cointopper/models/currency_list_response_model.dart';
import 'package:equatable/equatable.dart';

abstract class CurrencyListState extends Equatable {
  const CurrencyListState();

  @override
  List<Object> get props => [];
}

class CurrencyListLoadInProgress extends CurrencyListState {}

class CurrencyListLoadSuccess extends CurrencyListState {
  final List<CurrencyListResponseModel> currencyList;

  CurrencyListLoadSuccess(this.currencyList);

  @override
  List<Object> get props => [currencyList];
}

class CurrencyLoadFailure extends CurrencyListState {}
