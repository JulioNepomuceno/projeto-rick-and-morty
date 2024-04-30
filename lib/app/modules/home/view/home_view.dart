import 'package:flutter/material.dart';
import 'package:projeto_rick_and_morty/app/components/card.dart';
import 'package:projeto_rick_and_morty/app/data/models/character_model.dart';
import 'package:projeto_rick_and_morty/app/modules/home/controller/character_controller.dart';

import '../../../components/status_indicator.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  
  final controller = CharacterController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 34, 146, 173),
          title: const Center(child: Text('Rick and Morty')),
        ),
        body: FutureBuilder<List<Character>>(
          future: controller.getAllCharacter(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.isEmpty) {
                return const Center(
                  child: Text('Nenhum personagem disnopivel'),
                );
              }
              return AnimatedBuilder(
                  animation: controller ,
                  builder: (context, child) {
                    return HPGradView(
                        itemCount: controller.character.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                mainAxisExtent: 150),
                        padding:const EdgeInsets.all(10),
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
                                Text(character.name,
                                    overflow: TextOverflow.ellipsis ,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700, color: Colors.white),),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    StatusIndicator( status: character.status,),
                                    Text(
                                    '${character.status}-${character.species}',
                                    overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),),
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
        ));
  }
}
