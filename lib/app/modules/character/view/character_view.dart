import 'package:flutter/material.dart';
import 'package:projeto_rick_and_morty/app/components/hp_card.dart';
import 'package:projeto_rick_and_morty/app/components/hp_text_form_search.dart';
import 'package:projeto_rick_and_morty/app/data/models/character_model.dart';
import 'package:projeto_rick_and_morty/app/modules/character/controller/character_controller.dart';

import '../../../components/hp_status_indicator.dart';

class CharacterView extends StatefulWidget {
  
  final String? searchCharacter;

  const CharacterView({super.key,  this.searchCharacter});

  @override
  State<CharacterView> createState() => _CharacterViewState();
}

class _CharacterViewState extends State<CharacterView> {

  final controller = CharacterController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Rick And Morty - Personagens')),
      ),
      body: Column(
        children: [
           SizedBox(
            height: 90,
            child:  HPTextFormSearch(
              initialValue: widget.searchCharacter,
              label: 'Pesquisar personagem',
              suffix: const Icon(Icons.search),
              padding: const EdgeInsets.only(
                  top: 20, bottom: 10, right: 20, left: 20),
              onChanged: (value) {
                controller.onSearchDebounce(value);
                
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: FutureBuilder<List<Character>>(
              future: controller.getAllCharacter(widget.searchCharacter),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data!.isEmpty) {
                    return const Center(
                      child: Text('Nenhum personagem disnopivel'),
                    );
                  }
                  return AnimatedBuilder(
                      animation: controller,
                      builder: (context, child) {
                        return HPGradView(
                            itemCount: controller.character.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                    mainAxisExtent: 150),
                            padding: const EdgeInsets.all(10),
                            itemBuilder: (context, index) {
                              final character = controller.character[index];
                              return Container(
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 34, 146, 173),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(15)),
                                      child: Image.network(
                                        character.image,
                                        height: 100.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Text(
                                      character.name,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        StatusIndicator(
                                          status: character.status,
                                        ),
                                        Text(
                                          '${character.status}-${character.species}',
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            });
                      });
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Erro inesperado: ${snapshot.error}'),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
