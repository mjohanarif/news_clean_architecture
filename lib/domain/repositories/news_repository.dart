import 'package:dartz/dartz.dart';
import 'package:news_clean_architecture/common/common.dart';
import 'package:news_clean_architecture/domain/entities/news.dart';

// ignore: one_member_abstracts
abstract class NewsRepository {
  Future<Either<Failure, News>> getNews();
}
