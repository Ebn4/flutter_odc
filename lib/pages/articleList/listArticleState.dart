// To parse this JSON data, do
//
//     final listArticleState = listArticleStateFromMap(jsonString);

import 'dart:convert';

import 'package:app/business/models/category.dart';

import '../../business/models/article.dart';



class ListArticleState {
  List<Article>? article;
  List<Category>? categories;
  int? page;
  String? recherche;
  int? categoriesSelctionnee;
  bool? isLoading;

  ListArticleState({
    this.article,
    this.categories,
    this.page,
    this.recherche,
    this.categoriesSelctionnee,
    this.isLoading,
  });

  ListArticleState copyWith({
    List<Article>? article,
    List<Category>? categories,
    int? page,
    String? recherche,
    int? categoriesSelctionnee,
    bool? isLoading,
  }) =>
      ListArticleState(
        article: article ?? this.article,
        categories: categories ?? this.categories,
        page: page ?? this.page,
        recherche: recherche ?? this.recherche,
        categoriesSelctionnee: categoriesSelctionnee ??
            this.categoriesSelctionnee,
        isLoading: isLoading ?? this.isLoading,
      );


}


