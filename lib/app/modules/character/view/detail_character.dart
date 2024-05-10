import 'package:flutter/material.dart';
import 'package:projeto_rick_and_morty/app/components/hp_card_detalhe_character.dart';
import 'package:projeto_rick_and_morty/app/data/models/character_model.dart';

class DetailCharacter extends StatelessWidget {
  const DetailCharacter({super.key});

  @override
  Widget build(BuildContext context) {
    final character = ModalRoute.of(context)!.settings.arguments as Character;

    return Scaffold(
      appBar: AppBar(title: const Text('Detalhe do personagem')),
      body: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25, top: 40),
        child: Column(children: [
          CardCharacter(character: character),
        ]),
      ),
    );
  }
}
