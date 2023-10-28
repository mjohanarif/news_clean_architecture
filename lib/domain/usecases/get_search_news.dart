import 'package:dartz/dartz.dart';
import 'package:news_clean_architecture/common/failure.dart';
import 'package:news_clean_architecture/domain/entities/news.dart';
import 'package:news_clean_architecture/domain/repositories/news_repository.dart';

class GetSearchNews {
  const GetSearchNews({
    required this.repository,
  });

  final NewsRepository repository;

  Future<Either<Failure, News>> execute(String query) {
    return repository.getSearchNews(
      query,
    );
  }
}
