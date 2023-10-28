import 'package:dartz/dartz.dart';
import 'package:mason_very_good/common/failure.dart';
import 'package:mason_very_good/domain/entities/news.dart';
import 'package:mason_very_good/domain/repositories/news_repository.dart';

class GetNews {
  const GetNews({
    required this.repository,
  });

  final NewsRepository repository;

  Future<Either<Failure, News>> execute() {
    return repository.getNews();
  }
}
