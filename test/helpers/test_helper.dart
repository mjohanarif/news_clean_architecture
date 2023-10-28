import 'package:http/http.dart' as http;
import 'package:mason_very_good/domain/repositories/news_repository.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks(
  [
    NewsRepository,
  ],
  customMocks: [
    MockSpec<http.Client>(as: #MockHttpClient),
  ],
)
void main() {}
