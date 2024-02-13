import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:news_clean_architecture/bootstrap.dart';

import 'package:news_clean_architecture/data/data.dart';
import 'package:news_clean_architecture/domain/domain.dart';
import 'package:news_clean_architecture/firebase_options_dev.dart';
import 'package:news_clean_architecture/presentation/presentation.dart';

final locator = GetIt.instance;

Future<void> initLocator() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await getConfig();

  await dotenv.load(fileName: 'assets/.env');

  // bloc
  locator
    ..registerFactory(
      () => NewsBloc(
        locator(),
        locator(),
      ),
    )

    // usecase
    ..registerLazySingleton(
      () => GetNews(
        repository: locator(),
      ),
    )
    ..registerLazySingleton(
      () => GetSearchNews(
        repository: locator(),
      ),
    )

    // repository
    ..registerLazySingleton<NewsRepository>(
      () => NewsRepositoryImpl(
        remoteDataSource: locator(),
      ),
    )

    // data source
    ..registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(
        client: locator(),
      ),
    )

    // external
    ..registerLazySingleton(
      http.Client.new,
    );
}
