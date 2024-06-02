import '../exports.dart';

class MangaModel {
   int id;
   String title;
   int chapter;
   String link;
   String? posterLink;

  MangaModel(
      {required this.id,
      required this.title,
      required this.chapter,
      required this.link,
      this.posterLink});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'chapter': chapter,
      'link': link,
      'poster_link': posterLink
    };
  }

  void update({String? title, int? chapter, String? link, String? posterLink}){
    this.title = title ?? this.title;
    this.chapter = chapter ?? this.chapter;
    this.link = link ?? this.link;
    this.posterLink = posterLink ?? this.posterLink;
  }

  static MangaModel fromMap(Map<String, dynamic> map) {
    return MangaModel(
      id: map['id'] as int,
      title: map['title'] as String,
      chapter: map['chapter'] as int,
      link: map['link'] as String,
      posterLink: map['poster_link'] as String,
    );
  }
}
