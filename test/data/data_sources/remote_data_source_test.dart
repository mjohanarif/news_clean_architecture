import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:news_clean_architecture/common/common.dart';
import 'package:news_clean_architecture/data/data_sources/remote_data_source.dart';
import 'package:news_clean_architecture/data/models/news_model.dart';

import '../../helpers/json_reader.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockHttpClient mockHttpClient;
  late RemoteDataSourceImpl dataSource;

  setUp(() async {
    await dotenv.load(fileName: 'assets/.env');
    mockHttpClient = MockHttpClient();
    dataSource = RemoteDataSourceImpl(
      client: mockHttpClient,
    );
  });

  group('get news', () {
    final tNewsModel = NewsModel.fromJson(
      json.decode(
        readJson('helpers/dummy_data/dummy_news_response.json'),
      ) as Map<String, dynamic>,
    );

    test('should return news model when the response code is 200', () async {
      // arrange
      when(
        mockHttpClient
            .get(Uri.parse('${Urls.baseUrl}apiKey=${dotenv.get('API_KEY')}')),
      ).thenAnswer((_) async {
        return http.Response(
          readJson('helpers/dummy_data/dummy_news_response.json'),
          200,
        );
      });

      // act
      final result = await dataSource.getNews();

      // assert
      expect(result, equals(tNewsModel));
    });

    test(
        'should throw a server exception when the response'
        ' code is 404 or other', () async {
      // arrange
      when(
        mockHttpClient
            .get(Uri.parse('${Urls.baseUrl}apiKey=${dotenv.get('API_KEY')}')),
      ).thenAnswer(
        (_) async => http.Response('Not found', 404),
      );

      // act
      final call = dataSource.getNews();

      // assert
      expect(
        () => call,
        throwsA(isA<ServerException>()),
      );
    });
  });

  group('get search news', () {
    final tNewsModel = NewsModel.fromJson(
      json.decode(
        readJson('helpers/dummy_data/dummy_news_response.json'),
      ) as Map<String, dynamic>,
    );
    const tQuery = 'usa';

    test('should return news model when the response code is 200', () async {
      // arrange
      when(
        mockHttpClient.get(
          Uri.parse(
            '${Urls.baseUrl}apiKey=${dotenv.get('API_KEY')}&q=$tQuery',
          ),
        ),
      ).thenAnswer((_) async {
        return http.Response(
          readJson('helpers/dummy_data/dummy_news_response.json'),
          200,
        );
      });

      // act
      final result = await dataSource.getSearchNews(tQuery);

      // assert
      expect(result, equals(tNewsModel));
    });

    test(
        'should throw a server exception when the response'
        ' code is 404 or other', () async {
      // arrange
      when(
        mockHttpClient.get(
          Uri.parse(
            '${Urls.baseUrl}apiKey=${dotenv.get('API_KEY')}&q=$tQuery',
          ),
        ),
      ).thenAnswer(
        (_) async => http.Response('Not found', 404),
      );

      // act
      final call = dataSource.getSearchNews(tQuery);

      // assert
      expect(
        () => call,
        throwsA(isA<ServerException>()),
      );
    });
  });
}
