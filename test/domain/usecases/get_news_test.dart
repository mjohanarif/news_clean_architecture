import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mason_very_good/domain/entities/news.dart';
import 'package:mason_very_good/domain/usecases/get_news.dart';
import 'package:mockito/mockito.dart';

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
        source: Source(id: 'cnn', name: 'CNN'),
        author: 'Elizabeth Wolfe, Mary Gilbert',
        title:
            'Hurricane Otis kills at least 27 in devastating blow to Acapulco,'
            ' Mexico, that tore through high-rises and inundated roads - CNN',
        description:
            'Mexican officials arrived in Acapulco to find a city ripped apart'
            ' by a record-breaking Category 5 hurricane. At least 27 people are'
            ' dead and 80% of the city’s hotels have been impacted.',
        url:
            'https://www.cnn.com/2023/10/26/weather/hurricane-otis-acapulco-mexico-impact-thursday/index.html',
        urlToImage:
            'https://media.cnn.com/api/v1/images/stellar/prod/231026121620-08-hurricane-otis-mexico-1025.jpg?c=16x9&q=w_800,c_fill',
        publishedAt: '2023-10-26T22:24:00Z',
        content:
            'At least 27 people are dead and Acapulco, Mexico, has been left in'
            ' ruins after Hurricane Otis slammed into the coast Wednesday as a'
            ' record-breaking Category 5 storm.\r\nFour people are also'
            ' missing, Me… [+3144 chars]',
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
