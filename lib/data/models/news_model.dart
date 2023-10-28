import 'package:equatable/equatable.dart';
import 'package:news_clean_architecture/domain/entities/news.dart';

class NewsModel extends Equatable {
  const NewsModel({
    this.status,
    this.totalResults,
    this.articles,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      status: json['status'] as String?,
      totalResults: json['totalResults'] as int?,
      articles: (json['articles'] != null)
          ? (json['articles'] as List<dynamic>)
              .map((e) => ArticlesModel.fromJson(e as Map<String, dynamic>))
              .toList()
          : null,
    );
  }

  final String? status;
  final int? totalResults;
  final List<ArticlesModel>? articles;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['totalResults'] = totalResults;
    if (articles != null) {
      data['articles'] = articles!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  News toEntity() => News(
        status: status,
        totalResults: totalResults,
        articles: articles?.map((e) => e.toEntity()).toList(),
      );

  @override
  List<Object?> get props => [
        status,
        totalResults,
        articles,
      ];
}

class ArticlesModel extends Equatable {
  const ArticlesModel({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory ArticlesModel.fromJson(Map<String, dynamic> json) {
    return ArticlesModel(
      source: json['source'] != null
          ? SourceModel.fromJson(json['source'] as Map<String, dynamic>)
          : null,
      author: json['author'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      url: json['url'] as String?,
      urlToImage: json['urlToImage'] as String?,
      publishedAt: json['publishedAt'] as String?,
      content: json['content'] as String?,
    );
  }
  final SourceModel? source;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (source != null) {
      data['source'] = source!.toJson();
    }
    data['author'] = author;
    data['title'] = title;
    data['description'] = description;
    data['url'] = url;
    data['urlToImage'] = urlToImage;
    data['publishedAt'] = publishedAt;
    data['content'] = content;
    return data;
  }

  Articles toEntity() => Articles(
        source: source?.toEntity(),
        author: author,
        title: title,
        description: description,
        url: url,
        urlToImage: urlToImage,
        publishedAt: publishedAt,
        content: content,
      );

  @override
  List<Object?> get props => [
        source,
        author,
        title,
        description,
        url,
        urlToImage,
        publishedAt,
        content,
      ];
}

class SourceModel extends Equatable {
  const SourceModel({this.id, this.name});

  factory SourceModel.fromJson(Map<String, dynamic> json) {
    return SourceModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
    );
  }
  final String? id;
  final String? name;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }

  Source toEntity() => Source(
        id: id,
        name: name,
      );

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
