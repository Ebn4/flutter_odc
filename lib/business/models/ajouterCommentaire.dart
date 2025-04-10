class AjouterCommentaire {
  String? content;
  int?  articleId;

  AjouterCommentaire({this.content,this.articleId});

  AjouterCommentaire copyWith({
    String? content,
  }) =>
      AjouterCommentaire(
        content: content ?? this.content,
        articleId: articleId ?? this.articleId,
      )
      ;

  factory AjouterCommentaire.fromMap(Map<String, dynamic> json) =>
      AjouterCommentaire(
        content: json['content'],
        articleId: json['article_id']
      );

  Map<String, dynamic> toMap() => {
        "content": content,
      };

  Map toJson() {
    return {
      "content": content,
      "article_id":articleId
    };
  }
}
