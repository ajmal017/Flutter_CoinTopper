import 'package:cointopper/models/featured_news_list_response_model.dart';
import 'package:equatable/equatable.dart';

abstract class FeaturedNewsState extends Equatable {
  const FeaturedNewsState();

  @override
  List<Object> get props => [];
}

class FeaturedNewsListLoadInProgress extends FeaturedNewsState {}

class FeaturedNewsListLoadSuccess extends FeaturedNewsState {
  final List<FeaturedNewsListResponseModel> featuredNewsList;

  const FeaturedNewsListLoadSuccess([this.featuredNewsList = const []]);

  @override
  List<Object> get props => [featuredNewsList];
}

class FeaturedNewsLoadFailure extends FeaturedNewsState {}
