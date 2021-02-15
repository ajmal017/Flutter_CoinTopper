import 'package:equatable/equatable.dart';

class NewsDetailsEntity extends Equatable {
  final int id;
  final String titleEn;
  final String date;
  final String postLink;
  final String photoFile;
  final int visits;
  final String detailsEn;
  final String seoDescriptionEn;
  final String createdAt;

  NewsDetailsEntity(
    this.id,
    this.titleEn,
    this.date,
    this.postLink,
    this.photoFile,
    this.visits,
    this.detailsEn,
    this.seoDescriptionEn,
    this.createdAt,
  );

  @override
  List<Object> get props => [
        id,
        titleEn,
        date,
        postLink,
        photoFile,
        visits,
        seoDescriptionEn,
        createdAt
      ];

  Map<String, Object> toJson() {
    return {
      'id': id,
      'title_en': titleEn,
      'date': date,
      'post_link': postLink,
      'photo_file': photoFile,
      'visits': visits,
      'details_en': detailsEn,
      'seo_description_en': seoDescriptionEn,
      'created_at': createdAt
    };
  }

  static NewsDetailsEntity fromJson(Map<String, Object> json) {
    return NewsDetailsEntity(
      json['id'] as int,
      json['title_en'] as String,
      json['date'] as String,
      json['post_link'] as String,
      json['photo_file'] as String,
      json['visits'] as int,
      json['details_en'] as String,
      json['seo_description_en'] as String,
      json['created_at'] as String,
    );
  }
}
