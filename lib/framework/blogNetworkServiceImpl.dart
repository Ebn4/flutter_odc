import 'dart:convert';
import 'package:app/business/models/Authentification.dart';
import 'package:app/business/models/comment.dart';
import 'package:app/business/models/user.dart';
import 'package:app/business/services/blogNetworkService.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import '../business/models/article.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class BlogNetworkServiceImpl implements BlogNetworkService {
  @override
  Future<User?> authentifier(Authentification data) async {
    var url = Uri.parse("${dotenv.env['API_BASE_URL']}/login");
    var body = jsonEncode(data.toJson());
    var response = await http.post(
      url,
      body: body,
      headers: {"content-type": "application/json"},
    );

    print(response.statusCode);
    var codes = [200, 201];
    var resultat = jsonDecode(response.body) as Map;

    if (!codes.contains(response.statusCode)) {
      var error = resultat["error"];
      throw Exception(error);
    }
    var user = User.fromMap(resultat["data"]);
    return user;
  }



  // Bloc de traitement des opérations liées aux articles du blog : récupération, création, mise à jour.

  @override
  Future<List<Article>> recupererArticle() async {
    var url = Uri.parse("${dotenv.env['API_BASE_URL']}/articles");
    var response = await http.get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      List<dynamic> articleData = jsonResponse['data'];
      return articleData.map((article) => Article.fromMap(article)).toList();
    } else {
      throw Exception("Erreur lors de la récupération des articles");
    }
  }

  @override
  Future<void> liker(int articleid) async {
    var url = Uri.parse("${dotenv.env['API_BASE_URL']}/getAllArticles");
    var response = await http.get(url);
    print("Réponse brute de l'API : ${response.body}");
  }



  // Bloc de traitement des opérations liées aux commentaires.

  @override
  Future<bool> ajouterCommentaire(data, String token) async {
    var url = Uri.parse("${dotenv.env['API_BASE_URL']}/comments");
    var body = jsonEncode(data.toJson());
    var response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
      body: body,
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> supprimerCommentaire(int commentId, String token) async {
    var url = Uri.parse("${dotenv.env['API_BASE_URL']}/comments/${commentId}");
    var response = await http.delete(url);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<List<Comment>> recupererCommentaires(
    int articleId,
    String token,
  ) async {
    var url = Uri.parse("${dotenv.env['API_BASE_URL']}/comments/$articleId");
    var response = await http.get(
      url,
      headers: {"Authorization": "Bearer $token"},
    );
    if (response.statusCode == 200) {
      Map jsonResponse = jsonDecode(response.body);
      List data = jsonResponse["data"];
      return data.map((data) => Comment.fromJson(data)).toList();
    } else {
      throw Exception("Une erreur est survenue");
    }
  }

  @override
  Future<User> recupererUser(String token) async{
    var url = Uri.parse("${dotenv.env['BASE_URL']}/api/user");
    var response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );

    print(response.statusCode);
    print(response.body);

    if (response.statusCode != 200) {
      var error = jsonDecode(response.body)["error"];
      throw Exception(error);
    }

    var resultat = jsonDecode(response.body);
    var recupererUserConnecter = User.fromMap(resultat);
    return recupererUserConnecter;
  }
}
