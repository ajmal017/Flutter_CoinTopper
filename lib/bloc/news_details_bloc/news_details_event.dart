import 'package:cointopper/models/news_details_response_model.dart';
import 'package:equatable/equatable.dart';

abstract class NewsDetailsEvent extends Equatable {
  const NewsDetailsEvent();

  @override
  List<Object> get props => [];
}

class LoadNewsDetails extends NewsDetailsEvent {
  final int id;

  const LoadNewsDetails(this.id);

  @override
  List<int> get props => [id];
}

class UpdateNewsDetails extends NewsDetailsEvent {
  final List<NewsDetailsResponseModel> newsDetailsList;

  const UpdateNewsDetails(this.newsDetailsList);

  @override
  List<Object> get props => [newsDetailsList];
}
