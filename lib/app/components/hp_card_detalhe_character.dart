import 'package:flutter/material.dart';
import 'package:projeto_rick_and_morty/app/data/models/character_model.dart';

class CardCharacter extends StatelessWidget {

  final Character character;
  const CardCharacter({super.key, required this.character});
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(children: [
        Visibility(
          visible: character.image != null,
          replacement: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(5)),
            child: const Icon(
              Icons.person,
              size: 50,
            ),
          ),
          child: Hero(
            tag: character.id,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  image: DecorationImage(
                      image: NetworkImage(character.image ?? ''),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(5)),
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(character.name, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
            ),
            Row(
              children: [
                Text(
                  character.species,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const Text(' - '),
                Text(
                  character.gender,
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                )
              ],
            ),
            Text(
              character.status,
              style: TextStyle(fontSize: 19),
            )
          ],
        )
      ]),
    );
  }
}
