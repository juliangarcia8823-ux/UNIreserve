import 'package:flutter/material.dart';

import '../models/space.dart';
import '../viewmodels/spaces_viewmodel.dart';
import 'space_detail_page.dart';

class SpacesPage extends StatelessWidget {
  const SpacesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = SpacesViewModel();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1565C0),
        foregroundColor: Colors.white,
        title: const Text(
          'Espacios disponibles',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: FutureBuilder<List<Space>>(
        future: viewModel.getAvailableSpaces(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Text(
                  'No se pudieron cargar los espacios.\n\n${snapshot.error}',
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }

          final spaces = snapshot.data ?? [];

          if (spaces.isEmpty) {
            return const Center(
              child: Text(
                'No hay espacios disponibles.',
                style: TextStyle(fontSize: 16),
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: spaces.length,
            itemBuilder: (context, index) {
              final Space space = spaces[index];

              return Card(
                margin: const EdgeInsets.only(bottom: 14),
                elevation: 2,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SpaceDetailPage(
                          space: space,
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: const Color(0xFFE3F2FD),
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: const Icon(
                                Icons.meeting_room_outlined,
                                color: Color(0xFF1565C0),
                              ),
                            ),
                            const SizedBox(width: 14),
                            Expanded(
                              child: Text(
                                space.name,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Edificio: ${space.building}',
                          style: const TextStyle(fontSize: 15),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'Tipo: ${space.type}',
                          style: const TextStyle(fontSize: 15),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'Capacidad: ${space.capacity} personas',
                          style: const TextStyle(fontSize: 15),
                        ),
                        const SizedBox(height: 14),
                        Row(
                          children: [
                            const Icon(
                              Icons.check_circle,
                              size: 20,
                              color: Colors.green,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              space.available
                                  ? 'Disponible'
                                  : 'No disponible',
                              style: const TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
