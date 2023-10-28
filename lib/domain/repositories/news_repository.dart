import 'package:dartz/dartz.dart';
import 'package:mason_very_good/common/common.dart';
import 'package:mason_very_good/domain/entities/news.dart';

abstract class NewsRepository {
  Future<Either<Failure, News>> getNews();
}
