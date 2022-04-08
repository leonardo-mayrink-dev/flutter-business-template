import 'package:flutter/material.dart';
import 'package:flutter_business_template/0_presenter/screens/home/components/category_list.dart';
import 'package:flutter_business_template/1_domain/0_entities/category.dart';
import 'package:flutter_business_template/3_shared/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _indiceAtual = 0;
  String? _resultado = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //drawer: ,
        appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.grey),
            backgroundColor: Colors.white,
            title: Text(
              "Teste",
              style: TextStyle(
                  fontSize: 15,
                  fontStyle: FontStyle.italic,
                  color: Colors.black),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () => null,
              )
            ]),
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
                // backgroundColor: Colors.red,
                label: "Carrinho",
                icon: Icon(Icons.shopping_cart)),
          ],
        ),
        body: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
              GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    child: Column(
                      children: <Widget>[
                        Text(
                          categoryList[1].categoryName,
                          style: categoryList[1].isActive
                              ? TextStyle(
                                  color: kTextColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold)
                              : TextStyle(fontSize: 14),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          height: 3,
                          width: 22,
                          decoration: BoxDecoration(
                            color: categoryList[1].isActive
                                ? kPrimaryColor
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ],
                    ),
                  )),
            ])));
  }
}
