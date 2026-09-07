class Reservation {
  final int id;
  final int spaceId;
  final String spaceName;
  final DateTime date;
  final String startTime;
  final String endTime;
  final String status;

  const Reservation({
    required this.id,
    required this.spaceId,
    required this.spaceName,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.status,
  });
}
