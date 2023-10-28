import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_clean_architecture/domain/domain.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc(this._getNews) : super(NewsInitial()) {
    on<OnGetNews>((event, emit) async {
      emit(
        NewsLoading(),
      );

      final result = await _getNews.execute();
      result.fold(
        (failure) => emit(
          NewsError(message: failure.message),
        ),
        (data) => emit(
          NewsLoaded(result: data),
        ),
      );
    });
  }
  final GetNews _getNews;
}
