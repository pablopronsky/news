import 'package:floor/floor.dart';
import 'package:que_me_pongo/features/daily_news/data/models/article.dart';
import 'dart:async';
import 'package:sqflite/sqflite.dart' as sqflite;
part 'app_database.g.dart';

@dao
abstract class ArticleDao{
  @Insert()
  Future<void> insertArticle(ArticleModel article);
  @delete
  Future<void> deleteArticle(ArticleModel articleModel);
  @Query('SELECT * FROM article ')
  Future<List<ArticleModel>> getArticles();
}