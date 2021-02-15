import 'package:cointopper/models/news_list_response_model.dart';
import 'package:equatable/equatable.dart';

abstract class NewsListState extends Equatable {
  const NewsListState();

  @override
  List<Object> get props => [];
}

class NewsListLoadInProgress extends NewsListState {}

class NewsListLoadSuccess extends NewsListState {
  final List<NewsListResponseModel> newsList;

  const NewsListLoadSuccess([this.newsList = const []]);

  @override
  List<Object> get props => [newsList];
}

class NewsListLoadFailure extends NewsListState {}
