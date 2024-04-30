import 'package:flutter/material.dart';

class StatusIndicator extends StatelessWidget {
  final String status;

  const StatusIndicator({Key? key, required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Mapa de cores para cada status
    final Map<String, Color> statusColors = {
      'alive': Colors.green,
      'dead': Colors.red,
    };

    // Cor padrão
    Color color = Colors.grey;

    // Verifica se o status está no mapa de cores, se estiver, usa a cor correspondente
    if (statusColors.containsKey(status.toLowerCase())) {
      color = statusColors[status.toLowerCase()]!;
    }

    return Container(
      width: 8,
      height: 8,
      margin: EdgeInsets.only(right: 4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}
