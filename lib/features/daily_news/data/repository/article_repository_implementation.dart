import 'dart:io';

import 'package:que_me_pongo/core/constants/constants.dart';
import 'package:que_me_pongo/core/resources/data_state.dart';
import 'package:que_me_pongo/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:que_me_pongo/features/daily_news/domain/repository/article_repository.dart';
import '../models/article.dart';
import 'package:dio/dio.dart';

class ArticleRepositoryImplementation implements ArticleRepository{
  final NewsApiService _newsApiService;
  ArticleRepositoryImplementation(this._newsApiService);
  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() async {
    try {
      final httpResponse = await _newsApiService.getNewsArticles(
        apiKey: newsApiKey,
        country: countryQuery,
        category: categoryQuery,
      );
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(
            DioError(
                error: httpResponse.response.statusMessage,
                response: httpResponse.response,
                type: DioErrorType.response,
                requestOptions: httpResponse.response.requestOptions
            )
        );
      }
    } on DioError catch(e){
      return DataFailed(e);
    }
  }
}