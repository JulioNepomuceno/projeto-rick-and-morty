import 'package:flutter/material.dart';
import 'package:projeto_rick_and_morty/app/modules/character/view/detail_character.dart';
import 'package:projeto_rick_and_morty/app/modules/home/view/home_view.dart';
import 'package:projeto_rick_and_morty/theme/theme_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rick and Morty',
      theme: CustomThemeData.light(),
      darkTheme: CustomThemeData.dark(),
      themeMode: ThemeMode.system,
      home: const HomeView(),
      routes: {
        '/detailcharacter': (context) => const DetailCharacter()
      },
    );
    
  }
}
