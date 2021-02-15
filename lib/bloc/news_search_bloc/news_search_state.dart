import 'package:cointopper/models/search_news_response_model.dart';
import 'package:equatable/equatable.dart';

abstract class NewsSearchState extends Equatable {
  const NewsSearchState();

  @override
  List<Object> get props => [];
}

class NewsSearchLoadInProgress extends NewsSearchState {}

class NewsSearchLoadSuccess extends NewsSearchState {
  final List<SearchNewsResponseModel> newsSearchList;

  const NewsSearchLoadSuccess([this.newsSearchList = const []]);

  @override
  List<Object> get props => [newsSearchList];
}

class NewsSearchLoadFailure extends NewsSearchState {}
