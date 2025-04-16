import 'package:flutter/material.dart';
import 'package:pneus_prologapp/src/screens/tire_list_screen.dart';
import '../models/tire.dart';
import '../services/tire_service.dart';

class TireDetailScreen extends StatelessWidget {
  final int tireId;

  const TireDetailScreen({super.key, required this.tireId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        elevation: 4,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Detalhes do Pneu',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: FutureBuilder<Tire?>(
        future: TireService.getTireById(tireId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final tire = snapshot.data;

          if (tire == null) {
            return const Center(child: Text('Erro ao carregar dados.'));
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                _buildSectionCard(
                  context,
                  icon: Icons.info,
                  title: 'Informações Gerais',
                  children: [
                    _detailRow('Serial', tire.serialNumber),
                    _detailRow('DOT', tire.dot),
                    _detailRow('Status', tire.status),
                    _detailRow('Novo', tire.newTire == true ? 'Sim' : 'Não'),
                    _detailRow('Criado em', tire.createdAt),
                  ],
                ),
                _buildSectionCard(
                  context,
                  icon: Icons.speed,
                  title: 'Pressão & Sulcos',
                  children: [
                    _detailRow('Pressão Recomendada', '${tire.recommendedPressure ?? "-"} psi'),
                    _detailRow('Pressão Atual', '${tire.currentPressure ?? "-"} psi'),
                    _detailRow('Sulco Interno', '${tire.innerTreadDepth ?? "-"} mm'),
                    _detailRow('Sulco Externo', '${tire.outerTreadDepth ?? "-"} mm'),
                    _detailRow('Sulco Meio (int)', '${tire.middleInnerTreadDepth ?? "-"} mm'),
                    _detailRow('Sulco Meio (ext)', '${tire.middleOuterTreadDepth ?? "-"} mm'),
                  ],
                ),
                _buildSectionCard(
                  context,
                  icon: Icons.tire_repair,
                  title: 'Carcaça',
                  children: [
                    _detailRow('Marca', tire.make?.name),
                    _detailRow('Modelo', tire.model?.name),
                    _detailRow(
                      'Tamanho',
                      '${tire.tireSize?.width ?? "-"}/${tire.tireSize?.height ?? "-"}R${tire.tireSize?.rim ?? "-"}',
                    ),
                  ],
                ),
                _buildSectionCard(
                  context,
                  icon: Icons.settings_backup_restore,
                  title: 'Recapagem',
                  children: [
                    _detailRow('Marca', tire.currentRetread?.make?.name),
                    _detailRow('Modelo', tire.currentRetread?.model?.name),
                    _detailRow('Sulcos', '${tire.currentRetread?.model?.groovesQuantity ?? "-"}'),
                    _detailRow('Profundidade', '${tire.currentRetread?.model?.treadDepth ?? "-"} mm'),
                  ],
                ),
                if (tire.installed != null)
                  _buildSectionCard(
                    context,
                    icon: Icons.local_shipping,
                    title: 'Instalação',
                    children: [
                      _detailRow('Placa', tire.installed?.licensePlate),
                      _detailRow('Posição', tire.installed?.installedPositionName),
                      _detailRow('Frota', tire.installed?.fleetId),
                    ],
                  ),
                if (tire.disposal != null)
                  _buildSectionCard(
                    context,
                    icon: Icons.delete_forever,
                    title: 'Descarte',
                    children: [
                      _detailRow('Motivo', tire.disposal?.disposalReasonDescription),
                    ],
                  ),
                if (tire.analysis != null)
                  _buildSectionCard(
                    context,
                    icon: Icons.search,
                    title: 'Análise Recapadora',
                    children: [
                      _detailRow('Recapadora', tire.analysis?.recapperName),
                      _detailRow('Motivo', tire.analysis?.reason),
                    ],
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSectionCard(BuildContext context,
      {required IconData icon,
        required String title,
        required List<Widget> children}) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.blue[800]),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[800],
                  ),
                ),
              ],
            ),
            const Divider(),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _detailRow(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(
            child: Text(
              '$label:',
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
            child: Text(
              value ?? '-',
              textAlign: TextAlign.right,
              style: const TextStyle(color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}
