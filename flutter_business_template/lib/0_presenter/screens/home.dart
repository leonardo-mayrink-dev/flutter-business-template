import 'package:flutter/material.dart';
import 'package:flutter_business_template/0_presenter/screens/begin.dart';
import 'package:flutter_business_template/0_presenter/screens/inscription.dart';
import 'package:flutter_business_template/0_presenter/screens/library.dart';
import 'package:flutter_business_template/0_presenter/screens/trend.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _indiceAtual = 0;
  String? _resultado = "";

  @override
  Widget build(BuildContext context) {
    List<Widget> telas = [Begin(), Trend(), Inscription(), Library()];

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey),
        backgroundColor: Colors.white,
        title: Text(
          "Teste",
          style: TextStyle(
              fontSize: 15, fontStyle: FontStyle.italic, color: Colors.black),
        ), //Image.asset("images/youtube.png", width: 98, height: 22),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () => null,
            // onPressed: () async {
            //   String? res = await showSearch(
            //       context: context, delegate: CustomSearchDelegate());

            //   setState(() {
            //     _resultado = res;
            //   });
            //   print(res);
            // },
          ),
          /*
          IconButton(
            icon: Icon(Icons.videocam),
            onPressed: () {
              print("acao: videocam");
            },
          ),
          
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              print("acao: conta");
            },
          )
          */
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: telas[_indiceAtual],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: (indice) {
          setState(() {
            _indiceAtual = indice;
          });
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
        items: [
          BottomNavigationBarItem(
            // backgroundColor: Colors.orange,
            label: "Início",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
              // backgroundColor: Colors.red,
              label: "Em Alta",
              icon: Icon(Icons.whatshot)),
          BottomNavigationBarItem(
              // backgroundColor: Colors.blue,
              label: "Inscrições",
              icon: Icon(Icons.subscriptions)),
          BottomNavigationBarItem(
              // backgroundColor: Colors.green,
              label: "Biblioteca",
              icon: Icon(Icons.folder))
        ],
      ),
    );
  }
}
