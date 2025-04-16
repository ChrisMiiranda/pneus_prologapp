import 'package:flutter/material.dart';
import '../models/tire.dart';

class TireCard extends StatelessWidget {
  final Tire tire;
  final VoidCallback onTap;

  const TireCard({super.key, required this.tire, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final badge = _buildStatusBadge(tire.status);

    return InkWell(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Coluna da esquerda
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Serial destacado
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        tire.serialNumber ?? 'Sem número',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text.rich(
                      TextSpan(
                        text: 'Marca: ',
                        children: [
                          TextSpan(
                            text: tire.make?.name ?? '-',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Text('Menor sulco: ${_getMenorSulco(tire) ?? "N/A"}'),
                    if (tire.installed?.licensePlate != null)
                      Text('Placa: ${tire.installed!.licensePlate!}'),
                  ],
                ),
              ),

              const SizedBox(width: 16),

              // Coluna da direita
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    if (badge != null) badge,
                    const SizedBox(height: 16),
                    Text.rich(
                      TextSpan(
                        text: 'Modelo: ',
                        children: [
                          TextSpan(
                            text: tire.model?.name ?? '-',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.right,
                    ),
                    Text('Vida atual: ${tire.currentLifeCycle ?? "-"}'),
                    if (tire.installed?.installedPositionName != null)
                      Text('Posição: ${tire.installed!.installedPositionName!}'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String? _getMenorSulco(Tire tire) {
    final sulcos = [
      tire.innerTreadDepth,
      tire.outerTreadDepth,
      tire.middleInnerTreadDepth,
      tire.middleOuterTreadDepth,
    ].whereType<double>().toList();

    if (sulcos.isEmpty) return null;
    return '${sulcos.reduce((a, b) => a < b ? a : b).toStringAsFixed(1)} mm';
  }

  Widget? _buildStatusBadge(String? status) {
    if (status == null) return null;

    String label;
    Color color;

    switch (status) {
      case 'DISPOSAL':
        label = 'DESCARTE';
        color = Colors.red;
        break;
      case 'INSTALLED':
        label = 'APLICADO';
        color = Colors.blue;
        break;
      case 'INVENTORY':
        label = 'ESTOQUE';
        color = Colors.green;
        break;
      case 'ANALYSIS':
        label = 'EM ANÁLISE';
        color = Colors.amber[800]!; // tom forte de amarelo
        break;
      default:
        return null;
    }

    return Container(
      height: 30,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }
}
