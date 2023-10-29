part of 'news_bloc.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();

  @override
  List<Object?> get props => [];
}

class OnGetNews extends NewsEvent {
  const OnGetNews();
}

class OnGetSearchNews extends NewsEvent {
  const OnGetSearchNews(
    this.query,
  );

  final String query;

  @override
  List<Object?> get props => [
        query,
      ];
}
