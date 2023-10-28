import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:news_clean_architecture/common/common.dart';
import 'package:news_clean_architecture/data/data_sources/remote_data_source.dart';
import 'package:news_clean_architecture/domain/entities/news.dart';
import 'package:news_clean_architecture/domain/repositories/news_repository.dart';

class NewsRepositoryImpl implements NewsRepository {
  const NewsRepositoryImpl({
    required this.remoteDataSource,
  });

  final RemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, News>> getNews() async {
    try {
      final result = await remoteDataSource.getNews();
      return Right(
        result.toEntity(),
      );
    } on ServerException {
      return const Left(
        ServerFailure(''),
      );
    } on SocketException {
      return const Left(
        ConnectionFailure('Failed to connect to the network'),
      );
    }
  }
}
