import 'package:app/business/models/comment.dart';

class CommentState {
  List<Comment>? commentaires;
  String? texteNouveauCommentaire;
  int?  articleId;
  bool? isLoading;
  bool? isSending;

  CommentState({
    this.commentaires,
    this.texteNouveauCommentaire,
     this.articleId,
    this.isLoading,
    this.isSending,
  });

  CommentState copyWith({
    List<Comment>? commentaires,
    String? texteNouveauCommentaire,
    int? articleId,
    bool? isLoading,
    bool? isSending,
  }) {
    return CommentState(
      commentaires: commentaires ?? this.commentaires,
      texteNouveauCommentaire: texteNouveauCommentaire ?? this.texteNouveauCommentaire,
      articleId: articleId ?? this.articleId,
      isLoading: isLoading ?? this.isLoading,
      isSending: isSending ?? this.isSending,
    );
  }
}
