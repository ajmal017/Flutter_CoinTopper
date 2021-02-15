import 'package:cointopper/models/news_list_response_model.dart';
import 'package:equatable/equatable.dart';

abstract class NewsListEvent extends Equatable {
  const NewsListEvent();

  @override
  List<Object> get props => [];
}

class LoadNewsList extends NewsListEvent {}

class UpdateNewsList extends NewsListEvent {
  final List<NewsListResponseModel> newsList;

  const UpdateNewsList(this.newsList);

  @override
  List<Object> get props => [newsList];
}
