import 'package:flutter/material.dart';
import '../models/reservation.dart';
import '../viewmodels/reservations_viewmodel.dart';

class ReservationsPage extends StatelessWidget {
  const ReservationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = ReservationsViewModel();
    final reservations = viewModel.reservations;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1565C0),
        foregroundColor: Colors.white,
        title: const Text(
          'Mis reservas',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: reservations.isEmpty
          ? const Center(
              child: Text(
                'No tienes reservas registradas.',
                style: TextStyle(fontSize: 16),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: reservations.length,
              itemBuilder: (context, index) {
                final Reservation reservation = reservations[index];

                return Card(
                  margin: const EdgeInsets.only(bottom: 14),
                  elevation: 2,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
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
                                Icons.event_available,
                                color: Color(0xFF1565C0),
                              ),
                            ),
                            const SizedBox(width: 14),
                            Expanded(
                              child: Text(
                                reservation.spaceName,
                                style: const TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 18),
                        Text(
                          'Fecha: ${reservation.date.day}/${reservation.date.month}/${reservation.date.year}',
                          style: const TextStyle(fontSize: 15),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Horario: ${reservation.startTime} - ${reservation.endTime}',
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
                              reservation.status,
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
                );
              },
            ),
    );
  }
}
