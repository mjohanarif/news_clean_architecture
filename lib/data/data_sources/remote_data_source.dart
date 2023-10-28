import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:news_clean_architecture/common/common.dart';
import 'package:news_clean_architecture/data/models/news_model.dart';

abstract class RemoteDataSource {
  Future<NewsModel> getNews();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  const RemoteDataSourceImpl({
    required this.client,
  });

  final http.Client client;

  @override
  Future<NewsModel> getNews() async {
    final response = await client.get(
      Uri.parse('${Urls.baseUrl}apiKey=${dotenv.get('API_KEY')}'),
    );

    if (response.statusCode == 200) {
      return NewsModel.fromJson(
        json.decode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw ServerException();
    }
  }
}
