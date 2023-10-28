part of 'news_bloc.dart';

abstract class NewsEvent {
  const NewsEvent();
}

class OnGetNews extends NewsEvent {
  const OnGetNews();
}

class OnGetSearchNews extends NewsEvent {
  const OnGetSearchNews(
    this.query,
  );
  final String query;
}
