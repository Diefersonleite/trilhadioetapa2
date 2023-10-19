import 'package:flutter/material.dart';
import 'package:trilhadio/pages/dados_cadastrais.dart';
import 'package:trilhadio/pages/pagina1.dart';
import 'package:trilhadio/pages/pagina2.dart';
import 'package:trilhadio/pages/pagina3.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController controller = PageController(initialPage: 0);
  int posicaoPagina = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("Main page")),
        drawer: Drawer(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [ //Drawer é as 3 barras horizontais do menu lateral
                InkWell(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    width: double.infinity,
                    child: const Text("Dados cadastrais")),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>
                          const DadosCadastraisPage(texto: "Meus dados",
                          dados: ["Nome", "Endereço"],
                          )
                        )
                      );
                    },
                ),
                const Divider(),
                  InkWell(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    width: double.infinity,
                    child: const Text("Termos de uso e privacidade")), onTap: () {},
                ),
                const Divider(),
                InkWell(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    width: double.infinity,
                    child: const Text("Configurações")), onTap: () {},
                ),
              ]
            ),
          )
        ),
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: controller,
                onPageChanged: (value) {
                  setState(() {
                    posicaoPagina = value;
                  });
                },
                //scrollDirection: Axis.vertical, //altera a navegação de horizontal para vertical
                children: const [
                  Pagina1Page(),
                  Pagina2Page(),
                  Pagina3Page(),
              ],),
            ),
            BottomNavigationBar(
              onTap: (value) {
                controller.jumpToPage(value);
              },
              currentIndex: posicaoPagina, items:
              const [BottomNavigationBarItem(label: "Page 1", icon: Icon(Icons.home)),
              BottomNavigationBarItem(label: "Page 2", icon: Icon(Icons.add)),
              BottomNavigationBarItem(label: "Page 3", icon: Icon(Icons.person))])
          ],
        )
      ),
    );
  }
}