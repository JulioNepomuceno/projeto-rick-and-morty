import 'package:flutter/material.dart';
import 'package:projeto_rick_and_morty/app/modules/home/controller/character_controller.dart';

class HomeView extends StatefulWidget {
 const  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final controller = CharacterController();

  @override
  void initState(){
    super.initState();
    controller.getAllCharacter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: const Center(child:  Text('Rick and Morty')),
      ),
      body: (
        ListView.builder(
          itemCount: controller.character.length,
          itemBuilder: (context, i){
            final character = controller.character[i];
            return Column(
              children: [
                Text(character.name, style: TextStyle(color: Colors.black),),
               Image.network(character.image)
              ],
            );
          })
      ),
    );
  }
}