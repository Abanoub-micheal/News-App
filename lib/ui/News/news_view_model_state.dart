part of 'news_view_model_cubit.dart';

@immutable
sealed class NewsState {}

final class NewsLoading extends NewsState {
  final String loadingMessage;

  NewsLoading({required this.loadingMessage});
}
final class NewsError extends NewsState {
  final String errMessage;

  NewsError({required this.errMessage});
}
final class NewsSuccess extends NewsState {
  final List<Article>? articleList;

  NewsSuccess({required this.articleList});
}
