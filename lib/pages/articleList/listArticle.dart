
import 'package:app/pages/userProfil/userProfilPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../login/login.dart';
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
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        color: Color(0xFFFF6666),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ListarticlePage()),
              );
            },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFF6666),
                    elevation: 0
                ),

                child: Icon(Icons.home, color: Colors.white,size: 35,)
            ),

            ElevatedButton(onPressed: (){
              Navigator.push(
                context,
                //remplacé par la classe de la page de creation
                MaterialPageRoute(builder: (_) => ListarticlePage()),
              );
            },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFF6666),
                    elevation: 0
                ),
                child: Icon(Icons.add, color: Colors.white, size: 35,)
            ),

            ElevatedButton(onPressed: (){
              Navigator.push(
                context,
                //remplacé par la classe de la page user
                MaterialPageRoute(builder: (_) => UserProfilePage()),
              );
            },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFF6666),
                    elevation: 0
                ),
                child: Icon(Icons.person, color: Colors.white, size: 35, )
            )
          ],
        ),
      ),
    );
  }
}