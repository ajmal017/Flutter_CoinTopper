import 'package:cointopper/models/currencyList_response_model.dart';
import 'package:equatable/equatable.dart';

abstract class CurrencyListEvent extends Equatable {
  const CurrencyListEvent();

  @override
  List<Object> get props => [];
}

class LoadCurrencyList extends CurrencyListEvent {}

class UpdateCurrencyList extends CurrencyListEvent {
  final List<CurrencyListResponseModel> currencyList;

  const UpdateCurrencyList(this.currencyList);

  @override
  List<Object> get props => [currencyList];
}
