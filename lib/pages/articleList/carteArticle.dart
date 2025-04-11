import 'package:app/business/models/article.dart';
import 'package:app/pages/comment/commentPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';

class CarteArticles extends ConsumerWidget {
  final Article article;

  CarteArticles(this.article);

  @override
  Widget build(BuildContext context, WidgetRef) {
    return Container(
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5), // Couleur de l'ombre
            blurRadius: 10, // Intensité du flou
            spreadRadius: 2, // Taille de l'ombre
            offset: Offset(4, 4), // Déplacement horizontal et vertical
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // En-tête avec image et titre
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Titre : ${article.title != null && article.title!.length > 70 ? article.title!.substring(0, 70) + "..." : article.title ?? ""}",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Auteur: ${article.auteur?.name ?? ""}",
                        style: TextStyle(color: Colors.red, fontSize: 16),
                      ),
                      SizedBox(height: 5),
                    ],
                  ),
                ),
                SizedBox(height: 15),

                Container(
                  width: 400, // Largeur du rectangle
                  height: 150, // Hauteur du rectangle
                  decoration: BoxDecoration(
                    color: Colors.red,

                    borderRadius: BorderRadius.circular(15), // Coins arrondis
                    image: DecorationImage(
                      image: NetworkImage(article.photo!),
                      fit: BoxFit.cover, // Ajuste l'image
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 15),

            // Date de création
            Text(
              "Date: ${article.date_creation ?? "2025-03-31"}",
              style: TextStyle(color: Colors.white70, fontSize: 12),
            ),

            SizedBox(height: 15),

            // Section commentaires
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    

                  },
                  style: ElevatedButton.styleFrom(
                    iconColor: Colors.red[700],
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.thumb_up, color: Colors.white),

                      Text(
                        "${article.nb_Likes ?? 0}",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CommentPage(articleId: article.id!),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    iconColor: Colors.red[700],
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.comment, color: Colors.white),

                      Text(
                        "${article.nbr_comment ?? 0}",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ],
                  ),
                ),

                ElevatedButton(
                  onPressed: () {
                    Share.share('test',subject: 'test');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: Icon(Icons.share, color: Colors.white),
                  //child: Icon(Icons.heart_broken, color: Colors.red,)
                ),
              ],
            ),

            SizedBox(height: 10),

            // Bouton "Voir plus"
          ],
        ),
      ),
    );
  }
}
