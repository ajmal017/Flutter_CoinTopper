import 'package:cointopper/models/news_details_response_model.dart';
import 'package:equatable/equatable.dart';

abstract class NewsDetailsState extends Equatable {
  const NewsDetailsState();

  @override
  List<Object> get props => [];
}

class NewsDetailsLoadInProgress extends NewsDetailsState {}

class NewsDetailsLoadSuccess extends NewsDetailsState {
  final List<NewsDetailsResponseModel> newsDetailsList;

  const NewsDetailsLoadSuccess([this.newsDetailsList = const []]);

  @override
  List<Object> get props => [newsDetailsList];
}

class NewsDetailsLoadFailure extends NewsDetailsState {}
