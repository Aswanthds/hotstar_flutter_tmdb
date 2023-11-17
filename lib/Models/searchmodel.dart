// To parse this JSON data, do
//
//     final searchData = searchDataFromJson(jsonString);

import 'dart:convert';

List<SearchData> searchDataFromJson(String str) =>
    List.generate(searchDataFromJson(str).length, (index) => SearchData.fromJson(json.decode(str)));

String searchDataToJson(SearchData data) => json.encode(data.toJson());

class SearchData {
  int? page;
  List<SearchResult> ?results;
  int? totalPages;
  int? totalResults;

  SearchData({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory SearchData.fromJson(Map<String, dynamic> json) => SearchData(
        page: json["page"],
        results:
            List<SearchResult>.from(json["results"].map((x) => SearchResult.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "results": List<dynamic>.from(results!.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}

class SearchResult {
  bool? adult;
  String ?backdropPath;
  List<int>? genreIds;
  int ?id;
  String? originalLanguage;
  String? originalTitle;
  String ?overview;
  double? popularity;
  String? posterPath;
  DateTime? releaseDate;
  String? title;
  bool ?video;
  double? voteAverage;
  int? voteCount;

  SearchResult({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  factory SearchResult.fromJson(Map<String, dynamic> json) => SearchResult(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"].toDouble(),
        posterPath: json["poster_path"],
        releaseDate: DateTime.parse(json["release_date"]),
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "genre_ids": List<dynamic>.from(genreIds!.map((x) => x)),
        "id": id,
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "release_date":
            "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };
}
