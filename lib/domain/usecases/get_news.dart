import 'package:dartz/dartz.dart';
import 'package:news_clean_architecture/common/failure.dart';
import 'package:news_clean_architecture/domain/entities/news.dart';
import 'package:news_clean_architecture/domain/repositories/news_repository.dart';

class GetNews {
  const GetNews({
    required this.repository,
  });

  final NewsRepository repository;

  Future<Either<Failure, News>> execute() {
    return repository.getNews();
  }
}
