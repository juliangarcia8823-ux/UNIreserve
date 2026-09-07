class Space {
  final int id;
  final String name;
  final String building;
  final int capacity;
  final String type;
  final bool available;
  final String? description;

  const Space({
    required this.id,
    required this.name,
    required this.building,
    required this.capacity,
    required this.type,
    required this.available,
    this.description,
  });
}
