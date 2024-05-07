import 'package:flutter/material.dart';
import 'package:projeto_rick_and_morty/app/data/models/episode_model.dart';
import 'package:projeto_rick_and_morty/app/modules/episode/controller/episode_controller.dart';

class EpisodeView extends StatefulWidget {
  const EpisodeView({super.key});

  @override
  State<EpisodeView> createState() => _EpisodeViewState();
}

class _EpisodeViewState extends State<EpisodeView> {

  final controller = EpisodeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 34, 146, 173),
          title: const Center(child: Text('Rick And Morty - Episodios', style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300),))),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 20,bottom: 20),
          child: Center(
        child: Column(
          children: [
            const Text(
              'Lista de episodios',
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)
            ),
            FutureBuilder<List<Episode>>(
                future: controller.getAllEpisode(),
                builder: (context, snpashot) {
                  if (snpashot.hasData) {
                    if (snpashot.data!.isEmpty) {
                      return const Center(
                        child: Text('Nenhum episodio disponivel',),
                      );
                    }
                    return AnimatedBuilder(
                        animation: controller,
                        builder: (context, child) {
                          return ExpansionPanelList(
                            expansionCallback: controller.expansionCallback,
                            children:
                                controller.itens.map<ExpansionPanel>((item) {
                              return ExpansionPanel(
                                  isExpanded: item.isExpanded,
                                  headerBuilder: (context, isExpanded) {
                                    return ListTile(
                                      title: Text('Episodio - ${item.name}'),
                                      leading: const Icon(Icons.screenshot_monitor),
                                    );
                                  },
                                  body: Table(
                                    children: [
                                      TableRow(
                                        children: [
                                          ListTile(
                                            dense: true,
                                            title: Text('Data de exibição - ${item.air_date}'),
                                            leading: const Icon(Icons.calendar_month),
                                          ),
                                        ],
                                      ),
                                      TableRow(
                                        children: [
                                          ListTile(
                                            dense: true,
                                            title: Text('Codigo do episodio - ${item.episode}'),
                                            leading: const Icon(Icons.code_rounded),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ));
                            }).toList(),
                          );
                        });
                  } else if (snpashot.hasError) {
                    return Center(
                      child: Text('Erro inesperado: ${snpashot.error}'),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                })
          ],
        ),
      )),
    );
  }
}
