import 'artical_model.dart';

class NewsStateModel {
  final List<Article> articles;
  final bool isLoading;
  final String? errorMessage;

  NewsStateModel({
    required this.articles,
    required this.isLoading,
    this.errorMessage,
  });

  // Initial state
  factory NewsStateModel.initial() {
    return NewsStateModel(
      articles: [],
      isLoading: false,
      errorMessage: null,
    );
  }

  // CopyWith method to create a new instance of the state
  NewsStateModel copyWith({
    List<Article>? articles,
    bool? isLoading,
    String? errorMessage,
  }) {
    return NewsStateModel(
      articles: articles ?? this.articles,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}