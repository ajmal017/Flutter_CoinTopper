import 'package:equatable/equatable.dart';

class SearchNewsEntity extends Equatable {
  final int id;
  final String titleEn;
  final String date;
  final String postLink;
  final String photoFile;
  final int visits;
  final String seoDescriptionEn;
  final String createdAt;

  SearchNewsEntity(
    this.id,
    this.titleEn,
    this.date,
    this.postLink,
    this.photoFile,
    this.visits,
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
      'seo_description_en': seoDescriptionEn,
      'created_at': createdAt
    };
  }

  static SearchNewsEntity fromJson(Map<String, Object> json) {
    return SearchNewsEntity(
      json['id'] as int,
      json['title_en'] as String,
      json['date'] as String,
      json['post_link'] as String,
      json['photo_file'] as String,
      json['visits'] as int,
      json['seo_description_en'] as String,
      json['created_at'] as String,
    );
  }
}
