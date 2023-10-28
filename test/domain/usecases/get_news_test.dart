import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:news_clean_architecture/domain/entities/news.dart';
import 'package:news_clean_architecture/domain/usecases/get_news.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockNewsRepository mockNewsRepository;
  late GetNews usecase;

  setUp(() {
    mockNewsRepository = MockNewsRepository();
    usecase = GetNews(
      repository: mockNewsRepository,
    );
  });

  const testNews = News(
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

  test('should get news from the repository', () async {
    // arrange
    when(mockNewsRepository.getNews()).thenAnswer(
      (_) async => const Right(testNews),
    );

    // act
    final result = await usecase.execute();

    // assert
    expect(
      result,
      equals(
        const Right<dynamic, News>(testNews),
      ),
    );
  });
}
