class Article {
  final String title;
  final String description;
  final String urlToImage;
  final String publishedAt;

  Article({
    required this.title,
    required this.description,
    required this.urlToImage,
    required this.publishedAt,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['title'] ?? 'No Title',
      description: json['description'] ?? 'No Description',
      urlToImage: json['urlToImage'] ?? '',
      publishedAt: json['publishedAt'] ?? 'No Date',
    );
  }
}
