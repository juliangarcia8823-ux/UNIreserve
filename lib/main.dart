import 'package:flutter/material.dart';
import 'views/spaces_page.dart';
import 'views/reservation_page.dart';
import 'views/reservations_page.dart';
import 'views/cancel_reservation_page.dart';

void main() {
  runApp(const UniReserveApp());
}

class UniReserveApp extends StatelessWidget {
  const UniReserveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UniReserve',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1565C0),
        ),
        scaffoldBackgroundColor: const Color(0xFFF5F7FA),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1565C0),
        foregroundColor: Colors.white,
        title: const Text(
          'UniReserve',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Bienvenido a UniReserve',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Consulta y reserva espacios académicos de tu universidad.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Funciones principales',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),

            _buildMenuCard(
              context,
              icon: Icons.search,
              title: 'Consultar espacios',
              subtitle: 'Consulta los espacios disponibles',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SpacesPage(),
                  ),
                );
              },
            ),

            _buildMenuCard(
              context,
              icon: Icons.calendar_month,
              title: 'Realizar una reserva',
              subtitle: 'Reserva un espacio académico',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ReservationPage(),
                  ),
                );
              },
            ),

            _buildMenuCard(
              context,
              icon: Icons.event_note,
              title: 'Mis reservas',
              subtitle: 'Consulta tus reservas actuales',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ReservationsPage(),
                  ),
                );
              },
            ),

            _buildMenuCard(
              context,
              icon: Icons.cancel_outlined,
              title: 'Cancelar una reserva',
              subtitle: 'Cancela una reserva existente',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CancelReservationPage(),
                  ),
                );
              },
            ),

            _buildMenuCard(
              context,
              icon: Icons.meeting_room_outlined,
              title: 'Información del espacio',
              subtitle: 'Consulta detalles de un espacio',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SpacesPage()));
              },
            ),

            _buildMenuCard(
              context,
              icon: Icons.check_circle_outline,
              title: 'Confirmación de reserva',
              subtitle: 'Consulta el estado de tus reservas',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ReservationsPage()));
              },
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildMenuCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 1,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 8,
        ),
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: const Color(0xFFE3F2FD),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Icon(
            icon,
            color: const Color(0xFF1565C0),
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(subtitle),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 18,
        ),
        onTap: onTap,
      ),
    );
  }

}
