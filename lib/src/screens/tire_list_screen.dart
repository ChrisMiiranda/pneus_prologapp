import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/tire_provider.dart';
import 'tire_detail_screen.dart';
import '../widget/tire_card.dart';

class TireListScreen extends StatefulWidget {
  const TireListScreen({super.key});

  @override
  _TireListScreenState createState() => _TireListScreenState();
}

class _TireListScreenState extends State<TireListScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TireProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        elevation: 4,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {
            // lógica para abrir drawer ou menu lateral
          },
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Listagem de Pneus',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 2),
            Text(
              'Sudeste/Comercial',
              style: TextStyle(
                fontSize: 12,
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),
      body: provider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Scrollbar(
        controller: _scrollController,
        thumbVisibility: true,
        interactive: true,
        thickness: 10,
        radius: const Radius.circular(6),
        child: ListView.builder(
          controller: _scrollController,
          padding: const EdgeInsets.only(
            left: 16,
            right: 32,
            top: 8,
            bottom: 16,
          ),
          itemCount: provider.tires.length,
          itemBuilder: (context, index) {
            final tire = provider.tires[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: TireCard(
                tire: tire,
                onTap: () => Navigator.of(context).push(
                  PageRouteBuilder(
                    pageBuilder: (_, __, ___) => TireDetailScreen(tireId: tire.id),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero,
                  ),
                )
              ),
            );
          },
        ),
      ),
    );
  }
}
