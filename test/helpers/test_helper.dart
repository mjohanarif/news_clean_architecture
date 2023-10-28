import 'package:http/http.dart' as http;
import 'package:news_clean_architecture/domain/repositories/news_repository.dart';
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
