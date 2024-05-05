import 'package:flutter/material.dart';
import 'package:projeto_rick_and_morty/app/components/hp_text_form_search.dart';

class EpisodeView extends StatefulWidget {
  const EpisodeView({super.key});

  @override
  State<EpisodeView> createState() => _EpisodeViewState();
}

class _EpisodeViewState extends State<EpisodeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 34, 146, 173),
          title:  const Center(child: Text('Episodios'))),
      body: const Column(children: [
         SizedBox( 
          height: 90,
            child:  HPTextFormSearch(
              label: 'Pesquisar episodios',
              suffix:  Icon(Icons.search),
              padding:   EdgeInsets.only(
                  top: 20, bottom: 10, right: 20, left: 20),
            ),
        )
      ]),
    );
  }
}
