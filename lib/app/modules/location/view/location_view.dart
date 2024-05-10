import 'package:flutter/material.dart';
import 'package:projeto_rick_and_morty/app/components/hp_text_form_search.dart';
import 'package:projeto_rick_and_morty/app/data/models/location_model.dart';
import 'package:projeto_rick_and_morty/app/modules/location/controller/location_controller.dart';

class LocationView extends StatefulWidget {
  final String? searchCharacter;

  const LocationView({super.key, this.searchCharacter});

  @override
  State<LocationView> createState() => _LocationViewState();
}

class _LocationViewState extends State<LocationView> {
  final controller = LocationController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Center(
              child: Text(
            'Rick And Morty - Localização',
           
          ))),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 90,
              child: HPTextFormSearch(
                initialValue: widget.searchCharacter,
                label: 'Pesquise localização',
                suffix: const Icon(Icons.search),
                padding: const EdgeInsets.only(
                    top: 20, bottom: 10, right: 20, left: 20),
                onChanged: (value) {
                  controller.onSearchDebounce(value);
                },
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(vertical: 1),
                child: FutureBuilder<List<Location>>(
                    future: controller.getAllLocation(widget.searchCharacter),
                    builder: (context, snpashot) {
                      if (snpashot.hasData) {
                        if (snpashot.data!.isEmpty) {
                          return const Center(
                            child: Text(
                              'Nenhum localização disponivel',
                            ),
                          );
                        }
                        return AnimatedBuilder(
                            animation: controller,
                            builder: (context, child) {
                              return ExpansionPanelList(
                                expansionCallback: controller.expansionCallback,
                                children: controller.itens
                                    .map<ExpansionPanel>((item) {
                                  return ExpansionPanel(
                                    backgroundColor:
                                          Theme.of(context).primaryColor,
                                      isExpanded: item.isExpanded,
                                      headerBuilder: (context, isExpanded) {
                                        return ListTile(
                                          title: Text('Planeta - ${item.name}'),
                                          leading: const Icon(
                                              Icons.screenshot_monitor),
                                        );
                                      },
                                      body: Table(
                                        children: [
                                          TableRow(
                                            children: [
                                              ListTile(
                                                dense: true,
                                                title:
                                                    Text('Tipo - ${item.type}'),
                                                leading: const Icon(
                                                    Icons.place_rounded),
                                              ),
                                            ],
                                          ),
                                          TableRow(
                                            children: [
                                              ListTile(
                                                dense: true,
                                                title: Text(
                                                    'Codigo do episodio - ${item.dimension}'),
                                                leading: const Icon(
                                                    Icons.place_rounded),
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
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
