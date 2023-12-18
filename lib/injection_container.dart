import 'package:get_it/get_it.dart';
import 'package:que_me_pongo/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:dio/dio.dart';
import 'package:que_me_pongo/features/daily_news/data/repository/article_repository_implementation.dart';
import 'package:que_me_pongo/features/daily_news/domain/repository/article_repository.dart';
import 'package:que_me_pongo/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';

import 'features/daily_news/domain/usecases/get_article.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async{
  sl.registerSingleton<Dio>(Dio());
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));
  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImplementation(sl()));
  sl.registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()));
  sl.registerFactory<RemoteArticlesBloc>(()=> RemoteArticlesBloc(sl()));
}