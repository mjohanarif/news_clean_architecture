import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news_clean_architecture/domain/domain.dart';
import 'package:news_clean_architecture/presentation/presentation.dart';

class MockNewsBloc extends MockBloc<NewsEvent, NewsState> implements NewsBloc {}

class FakeNewsState extends Fake implements NewsState {}

class FakeNewsEvent extends Fake implements NewsEvent {}

void main() {
  late MockNewsBloc mockNewsBloc;

  setUpAll(() async {
    HttpOverrides.global = null;

    registerFallbackValue(
      FakeNewsState(),
    );

    registerFallbackValue(
      FakeNewsEvent(),
    );

    GetIt.instance.registerFactory(
      () => mockNewsBloc,
    );
  });

  setUp(() {
    mockNewsBloc = MockNewsBloc();
  });

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
        urlToImage: 'sd',
        publishedAt: '2023-10-27T06:21:04Z',
        content: '12 quick and healthy tiffin ideas for working women',
      ),
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
            'https://mg.com/thub/msid-104747674,width-1070,height-580,imgsize-48252,resizemode-75,overlay-toi_sw,pt-32,y_pad-40/photo.jpg',
        publishedAt: '2023-10-27T06:21:04Z',
        content: '12 quick and healthy tiffin ideas for working women',
      ),
    ],
  );
  Widget makeTestableWidget(Widget body) {
    // Print the widget tree to the console
    return BlocProvider<NewsBloc>.value(
      value: mockNewsBloc..add(const OnGetNews()),
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets(
    'opening app should trigger OnGetNews and state to change from'
    ' initial to loading',
    (WidgetTester tester) async {
      // arrange
      when(() => mockNewsBloc.state).thenReturn(
        NewsInitial(),
      );

      // act
      await tester.pumpWidget(
        makeTestableWidget(const NewsPage()),
      );

      // assert
      verify(
        () => mockNewsBloc.add(
          const OnGetNews(),
        ),
      ).called(1);
      expect(
        find.byType(TextField),
        equals(findsOneWidget),
      );
    },
  );

  testWidgets(
    'in initial state and loading should show circular progress indicator',
    (WidgetTester tester) async {
      // arrange
      when(() => mockNewsBloc.state).thenReturn(
        NewsInitial(),
      );

      // act
      await tester.pumpWidget(
        makeTestableWidget(const NewsPage()),
      );

      // assert
      expect(
        find.byType(CircularProgressIndicator),
        equals(findsOneWidget),
      );

      // assert
      expect(
        find.byType(ListView),
        equals(findsNothing),
      );
    },
  );

  testWidgets(
    'in loaded state should show Listview widget',
    (WidgetTester tester) async {
      // arrange
      when(() => mockNewsBloc.state).thenReturn(
        const NewsLoaded(result: tNews),
      );

      // act
      await tester.pumpWidget(
        makeTestableWidget(const NewsPage()),
      );

      // assert
      expect(
        find.byType(CircularProgressIndicator),
        equals(findsNothing),
      );

      // assert
      expect(
        find.byType(ListView),
        equals(findsOneWidget),
      );
    },
  );

  testWidgets(
    'in loaded state should show Listview widget',
    (WidgetTester tester) async {
      // arrange
      when(() => mockNewsBloc.state).thenReturn(
        const NewsLoaded(result: tNews),
      );

      // act
      await tester.pumpWidget(
        makeTestableWidget(const NewsPage()),
      );

      await tester.enterText(
        find.byType(TextField),
        'usa',
      );
      await tester.testTextInput.receiveAction(
        TextInputAction.done,
      );
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      verify(
        () => mockNewsBloc.add(
          const OnGetSearchNews('usa'),
        ),
      ).called(1);

      await tester.enterText(
        find.byType(TextField),
        '',
      );

      await tester.pumpAndSettle(const Duration(milliseconds: 500));

      // assert
      verify(
        () => mockNewsBloc.add(
          const OnGetNews(),
        ),
      ).called(2);
      expect(
        find.byType(ListView),
        equals(findsOneWidget),
      );
    },
  );
}
