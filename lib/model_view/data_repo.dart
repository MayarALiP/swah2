import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:swah/model/place.dart';
import 'package:swah/model_view/constants.dart';

class DataRepo {
  final Constants constants;

  DataRepo(this.constants);

  Future<List<Places>> fetchTravelPlaces() async {
    final response = await http.get(Uri.parse('${constants.baseUrl}${constants.placesEndPoint}'));

    if (response.statusCode == 200) {
      Iterable data = json.decode(response.body);
      List<Places> placesList = data.map((place) => Places.fromJson(place)).toList();
      return placesList;
    } else {
      throw Exception('Failed to load travel places');
    }
  }
}
