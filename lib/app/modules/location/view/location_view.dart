import 'package:flutter/material.dart';
import 'package:projeto_rick_and_morty/app/data/models/location_model.dart';
import 'package:projeto_rick_and_morty/app/modules/location/controller/location_controller.dart';

class LocationView extends StatefulWidget {
  const LocationView({super.key});

  @override
  State<LocationView> createState() => _LocationViewState();
}

class _LocationViewState extends State<LocationView> {

    final controller = LocationController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 34, 146, 173),
          title: const Center(child: Text('Rick And Morty - Localização', style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300),))),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 20,bottom: 20),
          child: Center(
        child: Column(
          children: [
            const Text(
              'Lista de localizacao',
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)
            ),
            FutureBuilder<List<Location>>(
                future: controller.getAllLocation(),
                builder: (context, snpashot) {
                  if (snpashot.hasData) {
                    if (snpashot.data!.isEmpty) {
                      return const Center(
                        child: Text('Nenhum localização disponivel',),
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
                                      title: Text('Planeta - ${item.name}'),
                                      leading: const Icon(Icons.screenshot_monitor),
                                    );
                                  },
                                  body: Table(
                                    children: [
                                      TableRow(
                                        children: [
                                          ListTile(
                                            dense: true,
                                            title: Text('Tipo - ${item.type}'),
                                            leading: const Icon(Icons.place_rounded),
                                          ),
                                        ],
                                      ),
                                      TableRow(
                                        children: [
                                          ListTile(
                                            dense: true,
                                            title: Text('Codigo do episodio - ${item.dimension}'),
                                            leading: const Icon(Icons.place_rounded),
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
