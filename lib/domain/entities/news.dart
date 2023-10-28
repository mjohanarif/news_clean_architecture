import 'package:equatable/equatable.dart';

class News extends Equatable {
  const News({
    this.status,
    this.totalResults,
    this.articles,
  });

  final String? status;
  final int? totalResults;
  final List<Articles>? articles;

  @override
  List<Object?> get props => [
        status,
        totalResults,
        articles,
      ];
}

class Articles extends Equatable {
  const Articles({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  final Source? source;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;

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

class Source extends Equatable {
  const Source({
    this.id,
    this.name,
  });

  final String? id;
  final String? name;

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
