part of 'news_bloc.dart';

abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object?> get props => [];
}

class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {}

class NewsError extends NewsState {
  const NewsError({
    required this.message,
  });
  final String message;

  @override
  List<Object?> get props => [
        message,
      ];
}

class NewsLoaded extends NewsState {
  const NewsLoaded({
    required this.result,
  });
  final News result;

  @override
  List<Object?> get props => [
        result,
      ];
}
