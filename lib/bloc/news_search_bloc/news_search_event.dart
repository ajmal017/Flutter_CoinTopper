import 'package:cointopper/models/search_news_response_model.dart';
import 'package:equatable/equatable.dart';

abstract class NewsSearchEvent extends Equatable {
  const NewsSearchEvent();

  @override
  List<Object> get props => [];
}

class LoadNewsSearch extends NewsSearchEvent {
  final String keyword;

  const LoadNewsSearch(this.keyword);

  @override
  List<String> get props => [keyword];
}

class UpdateNewsSearch extends NewsSearchEvent {
  final List<SearchNewsResponseModel> newsSearchList;

  const UpdateNewsSearch(this.newsSearchList);

  @override
  List<Object> get props => [newsSearchList];
}
