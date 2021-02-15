import 'package:cointopper/entities/search_news_entity.dart';
import 'package:meta/meta.dart';

@immutable
class SearchNewsResponseModel {
  final int id;
  final String titleEn;
  final String date;
  final String postLink;
  final String photoFile;
  final int visits;
  final String seoDescriptionEn;
  final String createdAt;

  SearchNewsResponseModel(
    this.id,
    this.titleEn,
    this.date,
    this.postLink,
    this.photoFile,
    this.visits,
    this.seoDescriptionEn,
    this.createdAt,
  );

  SearchNewsEntity toEntity() {
    return SearchNewsEntity(
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

  static SearchNewsResponseModel fromEntity(SearchNewsEntity entity) {
    return SearchNewsResponseModel(
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
