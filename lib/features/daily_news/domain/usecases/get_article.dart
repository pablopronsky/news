import 'package:que_me_pongo/core/resources/data_state.dart';
import 'package:que_me_pongo/core/usecases/usecase.dart';
import 'package:que_me_pongo/features/daily_news/domain/entities/article.dart';

import '../repository/article_repository.dart';

class GetArticleUseCase implements UseCase<DataState<List<ArticleEntity>>,void>{

  final ArticleRepository _articleRepository;

  GetArticleUseCase(this._articleRepository);

  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) {
    return _articleRepository.getNewsArticles();
  }

}