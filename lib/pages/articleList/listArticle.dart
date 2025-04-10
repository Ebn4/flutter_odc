
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../login/loginControl.dart';
import 'carteArticle.dart';
import 'listArticleCtrl.dart';



class ListarticlePage extends ConsumerStatefulWidget {
  @override
  ConsumerState<ListarticlePage> createState() => _ListArticleState();
}

class _ListArticleState extends ConsumerState<ListarticlePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(listArticleCtrlPorvider);
    var loginState = ref.watch(loginControlPorvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des articles', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.red,
       centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            var ctrl = ref.read(listArticleCtrlPorvider.notifier);
            ctrl.recupererArticle();
          }, icon: Icon(Icons.sync, color: Colors.white,))
        ],

      ),

      body: ListView.builder(

        itemCount: state.article?.length?? 0,
        itemBuilder: (context, i) {
          var article = state.article?[i];
          if (article == null) return Container();
          return CarteArticles(article);
        }
      ),
      backgroundColor: Colors.white,
    );
  }
}