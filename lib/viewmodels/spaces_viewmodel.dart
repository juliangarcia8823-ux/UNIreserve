import '../models/space.dart';
import '../services/api_service.dart';

class SpacesViewModel {
  final ApiService apiService;

  SpacesViewModel({ApiService? apiService})
      : apiService = apiService ?? ApiService();

  Future<List<Space>> getAvailableSpaces() async {
    final data = await apiService.getSpaces();

    return data.map((json) {
      return Space(
        id: json['id'] as int,
        name: json['name'] as String,
        building: 'Universidad',
        capacity: json['capacity'] as int,
        type: json['type'] as String,
        available: json['active'] as bool,
        description: json['description'] as String,
      );
    }).toList();
  }
}
