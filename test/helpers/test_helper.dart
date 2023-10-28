import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:news_clean_architecture/domain/repositories/news_repository.dart';

@GenerateMocks(
  [
    NewsRepository,
  ],
  customMocks: [
    MockSpec<http.Client>(as: #MockHttpClient),
  ],
)
void main() {}
