import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:news_clean_architecture/data/data_sources/remote_data_source.dart';
import 'package:news_clean_architecture/domain/repositories/news_repository.dart';

@GenerateMocks(
  [
    NewsRepository,
    RemoteDataSource,
  ],
  customMocks: [
    MockSpec<http.Client>(as: #MockHttpClient),
  ],
)
void main() {}
