import 'package:equatable/equatable.dart';

class GuidesEntity extends Equatable {
  final int id;
  final String title_en;
  final String date;
  final String post_link;
  final String photo_file;
  final int visits;
  final String seo_description_en;
  final String created_at;

  GuidesEntity(
    this.id,
    this.title_en,
    this.date,
    this.post_link,
    this.photo_file,
    this.visits,
    this.seo_description_en,
    this.created_at,
  );

  @override
  List<Object> get props => [
        id,
        title_en,
        date,
        post_link,
        photo_file,
        visits,
        seo_description_en,
        created_at,
      ];

  Map<String, Object> toJson() {
    return {
      "id": id,
      "title_en": title_en,
      "date": date,
      "post_link": post_link,
      "photo_file": photo_file,
      "visits": visits,
      "seo_description_en": seo_description_en,
      "created_at": created_at,
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
