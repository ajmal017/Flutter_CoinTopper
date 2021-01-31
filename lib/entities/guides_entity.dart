import 'package:equatable/equatable.dart';

class GuidesEntity extends Equatable {
  final int id;
  final String titleEN;
  final String date;
  final String postLink;
  final String photoFile;
  final int visits;
  final String seoDescriptionEN;
  final String createdAt;

  GuidesEntity(
    this.id,
    this.titleEN,
    this.date,
    this.postLink,
    this.photoFile,
    this.visits,
    this.seoDescriptionEN,
    this.createdAt,
  );

  @override
  List<Object> get props => [
        id,
        titleEN,
        date,
        postLink,
        photoFile,
        visits,
        seoDescriptionEN,
        createdAt,
      ];

  Map<String, Object> toJson() {
    return {
      "id": id,
      "title_en": titleEN,
      "date": date,
      "post_link": postLink,
      "photo_file": photoFile,
      "visits": visits,
      "seo_description_en": seoDescriptionEN,
      "created_at": createdAt,
    };
  }

  static GuidesEntity fromJson(Map<String, Object> json) {
    return GuidesEntity(
      json["id"] as int,
      json["title_en"] as String,
      json["date"] as String,
      json["post_link"] as String,
      json["photo_file"] as String,
      json["visits"] as int,
      json["seo_description_en"] as String,
      json["created_at"] as String,
    );
  }
}
