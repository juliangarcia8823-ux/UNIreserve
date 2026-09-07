import 'package:flutter/material.dart';
import '../models/space.dart';
class SpaceDetailPage extends StatelessWidget {
  final Space space;

  const SpaceDetailPage({
    super.key,
    required this.space,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1565C0),
        foregroundColor: Colors.white,
        title: const Text(
          'Información del espacio',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  color: const Color(0xFFE3F2FD),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: const Icon(
                  Icons.meeting_room_outlined,
                  size: 48,
                  color: Color(0xFF1565C0),
                ),
              ),
            ),
            const SizedBox(height: 24),

            Center(
              child: Text(
                space.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 30),

            _buildInfoCard(
              icon: Icons.business,
              title: 'Edificio',
              value: space.building,
            ),

            _buildInfoCard(
              icon: Icons.category_outlined,
              title: 'Tipo de espacio',
              value: space.type,
            ),

            _buildInfoCard(
              icon: Icons.people_outline,
              title: 'Capacidad',
              value: '${space.capacity} personas',
            ),

            _buildInfoCard(
              icon: Icons.check_circle_outline,
              title: 'Estado',
              value: space.available ? 'Disponible' : 'No disponible',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 14),
      color: Colors.white,
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 8,
        ),
        leading: Icon(
          icon,
          color: const Color(0xFF1565C0),
          size: 28,
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.black54,
            fontSize: 14,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(
            value,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
