import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:news_clean_architecture/data/models/news_model.dart';
import 'package:news_clean_architecture/domain/entities/news.dart';

import '../../helpers/json_reader.dart';

void main() {
  const tNewsModel = NewsModel(
    status: 'ok',
    totalResults: 2,
    articles: [
      ArticlesModel(
        source:
            SourceModel(id: 'the-times-of-india', name: 'The Times of India'),
        author: 'TIMESOFINDIA.COM',
        title: 'India Mobile Congress: After 5G, India aims to lead in 6G as'
            ' well, PM Modi says - IndiaTimes',
        description:
            'India News: PM Modi on Friday inaugurated the 7th Edition of the'
            ' India Mobile Congress at the recently-launched Bharat Mandapam.'
            ' "We are not only expanding 5G in',
        url:
            'https://timesofindia.indiatimes.com/india/india-mobile-congress-after-5g-india-aims-to-lead-in-6g-as-well-pm-modi-says/articleshow/104746054.cms',
        urlToImage:
            'https://static.toiimg.com/thumb/msid-104747674,width-1070,height-580,imgsize-48252,resizemode-75,overlay-toi_sw,pt-32,y_pad-40/photo.jpg',
        publishedAt: '2023-10-27T06:21:04Z',
        content: '12 quick and healthy tiffin ideas for working women',
      ),
    ],
  );
  const tNews = News(
    status: 'ok',
    totalResults: 2,
    articles: [
      Articles(
        source: Source(id: 'the-times-of-india', name: 'The Times of India'),
        author: 'TIMESOFINDIA.COM',
        title:
            'India Mobile Congress: After 5G, India aims to lead in 6G as well,'
            ' PM Modi says - IndiaTimes',
        description:
            'India News: PM Modi on Friday inaugurated the 7th Edition of the'
            ' India Mobile Congress at the recently-launched Bharat Mandapam.'
            ' "We are not only expanding 5G in',
        url:
            'https://timesofindia.indiatimes.com/india/india-mobile-congress-after-5g-india-aims-to-lead-in-6g-as-well-pm-modi-says/articleshow/104746054.cms',
        urlToImage:
            'https://static.toiimg.com/thumb/msid-104747674,width-1070,height-580,imgsize-48252,resizemode-75,overlay-toi_sw,pt-32,y_pad-40/photo.jpg',
        publishedAt: '2023-10-27T06:21:04Z',
        content: '12 quick and healthy tiffin ideas for working women',
      ),
    ],
  );

  group('to entity', () {
    test('should be a subclass of news entity', () async {
      final result = tNewsModel.toEntity();
      expect(
        result,
        equals(tNews),
      );
    });
  });

  group('from json', () {
    test('should return a valid model from json', () async {
      // arrange
      final jsonMap = json.decode(
        readJson('helpers/dummy_data/dummy_news_response.json'),
      ) as Map<String, dynamic>;

      // act
      final result = NewsModel.fromJson(jsonMap);

      // assert
      expect(result, equals(tNewsModel));
    });
  });
  group('to json', () {
    test('should return a json map containing proper data', () async {
      // act
      final result = tNewsModel.toJson();

      // assert
      final expectedJsonMap = {
        'status': 'ok',
        'totalResults': 2,
        'articles': [
          {
            'source': {
              'id': 'the-times-of-india',
              'name': 'The Times of India',
            },
            'author': 'TIMESOFINDIA.COM',
            'title': 'India Mobile Congress: After 5G, India aims to lead in 6G'
                ' as well, PM Modi says - IndiaTimes',
            'description': 'India News: PM Modi on Friday inaugurated the 7th'
                ' Edition of the India Mobile Congress at the recently-launched'
                ' Bharat Mandapam. "We are not only expanding 5G in',
            'url':
                'https://timesofindia.indiatimes.com/india/india-mobile-congress-after-5g-india-aims-to-lead-in-6g-as-well-pm-modi-says/articleshow/104746054.cms',
            'urlToImage':
                'https://static.toiimg.com/thumb/msid-104747674,width-1070,height-580,imgsize-48252,resizemode-75,overlay-toi_sw,pt-32,y_pad-40/photo.jpg',
            'publishedAt': '2023-10-27T06:21:04Z',
            'content': '12 quick and healthy tiffin ideas for working women',
          }
        ],
      };
      expect(result, equals(expectedJsonMap));
    });
  });
}
