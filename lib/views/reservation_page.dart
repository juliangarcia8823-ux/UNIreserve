import 'package:flutter/material.dart';
import '../models/space.dart';

class ReservationPage extends StatefulWidget {
  const ReservationPage({super.key});

  @override
  State<ReservationPage> createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage> {
  final List<Space> spaces = const [
    Space(
      id: 1,
      name: 'Aula 101',
      building: 'Bloque A',
      capacity: 30,
      type: 'Aula',
      available: true,
    ),
    Space(
      id: 2,
      name: 'Laboratorio de Sistemas',
      building: 'Bloque B',
      capacity: 25,
      type: 'Laboratorio',
      available: true,
    ),
    Space(
      id: 3,
      name: 'Sala de Informática 201',
      building: 'Bloque B',
      capacity: 40,
      type: 'Sala de informática',
      available: true,
    ),
    Space(
      id: 4,
      name: 'Auditorio Principal',
      building: 'Bloque C',
      capacity: 120,
      type: 'Auditorio',
      available: true,
    ),
  ];

  Space? selectedSpace;
  DateTime? selectedDate;
  TimeOfDay? startTime;
  TimeOfDay? endTime;

  Future<void> _selectDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (date != null) {
      setState(() {
        selectedDate = date;
      });
    }
  }

  Future<void> _selectStartTime() async {
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (time != null) {
      setState(() {
        startTime = time;
      });
    }
  }

  Future<void> _selectEndTime() async {
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (time != null) {
      setState(() {
        endTime = time;
      });
    }
  }

  void _confirmReservation() {
    if (selectedSpace == null ||
        selectedDate == null ||
        startTime == null ||
        endTime == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Completa todos los campos de la reserva.'),
        ),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Reserva confirmada'),
          content: Text(
            'Has reservado ${selectedSpace!.name} correctamente.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1565C0),
        foregroundColor: Colors.white,
        title: const Text(
          'Realizar una reserva',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Nueva reserva',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Selecciona el espacio, la fecha y el horario.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 24),

            const Text(
              'Espacio académico',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            DropdownButtonFormField<Space>(
              initialValue: selectedSpace,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon: const Icon(Icons.meeting_room_outlined),
              ),
              hint: const Text('Selecciona un espacio'),
              items: spaces.map((space) {
                return DropdownMenuItem(
                  value: space,
                  child: Text(space.name),
                );
              }).toList(),
              onChanged: (space) {
                setState(() {
                  selectedSpace = space;
                });
              },
            ),

            const SizedBox(height: 20),

            const Text(
              'Fecha',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            OutlinedButton.icon(
              onPressed: _selectDate,
              icon: const Icon(Icons.calendar_month),
              label: Text(
                selectedDate == null
                    ? 'Seleccionar fecha'
                    : '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',
              ),
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(double.infinity, 52),
                alignment: Alignment.centerLeft,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Hora de inicio',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            OutlinedButton.icon(
              onPressed: _selectStartTime,
              icon: const Icon(Icons.access_time),
              label: Text(
                startTime == null
                    ? 'Seleccionar hora de inicio'
                    : startTime!.format(context),
              ),
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(double.infinity, 52),
                alignment: Alignment.centerLeft,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Hora de finalización',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            OutlinedButton.icon(
              onPressed: _selectEndTime,
              icon: const Icon(Icons.access_time_filled),
              label: Text(
                endTime == null
                    ? 'Seleccionar hora de finalización'
                    : endTime!.format(context),
              ),
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(double.infinity, 52),
                alignment: Alignment.centerLeft,
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton.icon(
                onPressed: _confirmReservation,
                icon: const Icon(Icons.check),
                label: const Text(
                  'Confirmar reserva',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1565C0),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
