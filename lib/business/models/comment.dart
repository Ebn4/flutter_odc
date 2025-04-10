import 'package:app/business/models/user.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

Comment commentFromJson(String str) => Comment.fromJson(json.decode(str));

String commentToJson(Comment data) => json.encode(data.toJson());

class Comment {
    int id;
    String content;
    int articleId;
    User user;
    String dateCreation;

    Comment({
        required this.id,
        required this.content,
        required this.articleId,
        required this.user,
        required this.dateCreation,
    });

    Comment copyWith({
        int? id,
        String? content,
        int? articleId,
        User? user,
        String? dateCreation,
    }) => 
        Comment(
            id: id ?? this.id,
            content: content ?? this.content,
            articleId: articleId ?? this.articleId,
            user: user ?? this.user,
            dateCreation: dateCreation ?? this.dateCreation,
        );

    factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        id: json["id"],
        content: json["content"],
        articleId: json["article_id"],
        user: User.fromMap(json["user"]),
        dateCreation: json["date_creation"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "content": content,
        "article_id": articleId,
        "user": user.toMap(),
        "date_creation": dateCreation,
    };
}