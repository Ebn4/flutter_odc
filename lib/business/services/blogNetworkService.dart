import 'package:app/business/models/Authentification.dart';
import 'package:app/business/models/ajouterCommentaire.dart';
import 'package:app/business/models/comment.dart';
import 'package:app/business/models/user.dart';

import '../models/article.dart';

abstract class BlogNetworkService {
  Future<User?> authentifier(Authentification data);
  Future<List<Article>> recupererArticle();
  Future<void> liker(int articleid);

  Future<List<Comment>> recupererCommentaires(int articleId, String token);
  Future<bool> supprimerCommentaire(int commentId, String token);
  Future<bool> ajouterCommentaire(AjouterCommentaire data, String token);
}
