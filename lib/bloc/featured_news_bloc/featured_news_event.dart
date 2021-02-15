import 'package:cointopper/models/featured_news_list_response_model.dart';
import 'package:equatable/equatable.dart';

abstract class FeaturedNewsEvent extends Equatable {
  const FeaturedNewsEvent();

  @override
  List<Object> get props => [];
}

class LoadFeaturedNewsList extends FeaturedNewsEvent {}

class UpdateFeaturedNewsList extends FeaturedNewsEvent {
  final List<FeaturedNewsListResponseModel> featuredNewsList;

  const UpdateFeaturedNewsList(this.featuredNewsList);

  @override
  List<Object> get props => [featuredNewsList];
}
