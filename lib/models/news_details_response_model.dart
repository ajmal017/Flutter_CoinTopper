import 'package:cointopper/entities/news_details_entity.dart';
import 'package:meta/meta.dart';

@immutable
class NewsDetailsResponseModel {
  final int id;
  final String titleEn;
  final String date;
  final String postLink;
  final String photoFile;
  final int visits;
  final String detailsEn;
  final String seoDescriptionEn;
  final String createdAt;

  NewsDetailsResponseModel(
      this.id,
      this.titleEn,
      this.date,
      this.postLink,
      this.photoFile,
      this.visits,
      this.detailsEn,
      this.seoDescriptionEn,
      this.createdAt);

  NewsDetailsEntity toEntity() {
    return NewsDetailsEntity(
      id,
      titleEn,
      date,
      postLink,
      photoFile,
      visits,
      detailsEn,
      seoDescriptionEn,
      createdAt,
    );
  }

  static NewsDetailsResponseModel fromEntity(NewsDetailsEntity entity) {
    return NewsDetailsResponseModel(
        entity.id,
        entity.titleEn,
        entity.date,
        entity.postLink,
        entity.photoFile,
        entity.visits,
        entity.detailsEn,
        entity.seoDescriptionEn,
        entity.createdAt);
  }
}
