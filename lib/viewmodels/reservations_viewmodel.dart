import '../models/reservation.dart';

class ReservationsViewModel {
  List<Reservation> get reservations {
    return [
      Reservation(
        id: 1,
        spaceId: 1,
        spaceName: 'Aula 101',
        date: DateTime.now().add(const Duration(days: 1)),
        startTime: '08:00 AM',
        endTime: '10:00 AM',
        status: 'Confirmada',
      ),
    ];
  }
}
