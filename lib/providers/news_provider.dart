import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../component/check_internet_connection.dart';
import '../component/toast_msg.dart';
import '../model/artical_model.dart';
import '../network/dio_exception.dart';
import '../network/news_service_network.dart';

// Riverpod provider to access the NewsNotifier
final newsProvider =
    StateNotifierProvider<NewsNotifier, AsyncValue<List<Article>>>((ref) {
  return NewsNotifier(ref);
});

// StateNotifier for managing the news state
class NewsNotifier extends StateNotifier<AsyncValue<List<Article>>> {
  NewsNotifier(this.ref) : super(const AsyncValue.loading());
  final Ref ref;

  getData(context,country) async {

      try {
        List<Article> result =
            await NewsServiceNetwork().fetchArticles(country);
        List<Article> article = result;
        state = AsyncValue.data(article);
      } on DioException catch (e) {
        return state = AsyncValue.error(
            DioExceptionRepo.fromDioError(e).toString(), StackTrace.current);
      }

  }
}
