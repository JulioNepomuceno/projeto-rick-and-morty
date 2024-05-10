import 'package:flutter/material.dart';
import 'package:projeto_rick_and_morty/app/modules/character/view/character_view.dart';
import 'package:projeto_rick_and_morty/app/modules/episode/view/episode_view.dart';
import 'package:projeto_rick_and_morty/app/modules/location/view/location_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int paginaAtual = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: paginaAtual);
  }

  setPaginaAtual(pagina){
    setState(() {
      paginaAtual = pagina;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: [
          CharacterView(),
          EpisodeView(),
          LocationView()
        ],
        onPageChanged: setPaginaAtual,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 34, 146, 173),
        unselectedItemColor: Colors.white,
        selectedItemColor: Color.fromARGB(255, 253, 228, 0),
        currentIndex: paginaAtual,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.person_2,), label: 'Personagens',),
          BottomNavigationBarItem(icon: Icon(Icons.screenshot_monitor), label: 'Episodios'),
          BottomNavigationBarItem(icon: Icon(Icons.location_on_rounded), label: 'Localização'),

        ],
        onTap: (pagina){
          pageController.animateToPage(pagina, duration: Duration(milliseconds: 400), curve: Curves.ease);
        },
      ),
    );
  }
}
