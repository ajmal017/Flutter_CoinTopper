import 'package:cointopper/entities/featured_news_list_entity.dart';
import 'package:meta/meta.dart';

@immutable
class FeaturedNewsListResponseModel {
  final int id;
  final String titleEn;
  final String date;
  final String postLink;
  final String photoFile;
  final int visits;
  final String seoDescriptionEn;
  final String createdAt;

  FeaturedNewsListResponseModel(
    this.id,
    this.titleEn,
    this.date,
    this.postLink,
    this.photoFile,
    this.visits,
    this.seoDescriptionEn,
    this.createdAt,
  );

  FeaturedNewsListEntity toEntity() {
    return FeaturedNewsListEntity(
      id,
      titleEn,
      date,
      postLink,
      photoFile,
      visits,
      seoDescriptionEn,
      createdAt,
    );
  }

  static FeaturedNewsListResponseModel fromEntity(
      FeaturedNewsListEntity entity) {
    return FeaturedNewsListResponseModel(
        entity.id,
        entity.titleEn,
        entity.date,
        entity.postLink,
        entity.photoFile,
        entity.visits,
        entity.seoDescriptionEn,
        entity.createdAt);
  }
}
