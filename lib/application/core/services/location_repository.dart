// Package imports:
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

abstract class LocationInteface {
  Future<String> getAddressFromLatLng(LatLng location, http.Client client);
  Future<LatLng> getLatLngFromAddress(String placeID, http.Client client);

  Future<List<dynamic>> getSuggestion(
      String input, String _sessionToken, http.Client client);
}

// class LocationRepository implements LocationInteface {
//   Future<List<dynamic>> getSuggestion(
//       String input, String _sessionToken, http.Client client) async {
//     String baseURL =
//         'https://maps.googleapis.com/maps/api/place/autocomplete/json';
//     String request =
//         '$baseURL?input=$input&key=$kPLACES_API_KEY&sessiontoken=$_sessionToken';

//     http.Response response = await client.get(Uri.parse(request));
//     if (response.statusCode == 200) {
//       return json.decode(response.body)['predictions'] as List<dynamic>;
//     } else {
//       throw Exception('Failed to load predictions');
//     }
//   }

//   Future<LatLng> getLatLngFromAddress(
//       String placeID, http.Client client) async {

//     http.Response response = await client.get(Uri.parse(
//         'https://maps.googleapis.com/maps/api/place/details/json?placeid=$placeID&key=$kPLACES_API_KEY'));

//     if (response.statusCode == 200) {
//       Map<String, dynamic> locationData = json.decode(response.body)['result']
//           ['geometry']['location'] as Map<String, dynamic>;
//       LatLng tempPinPosition =
//           LatLng(locationData['lat'] as double, locationData['lng'] as double);

//       return tempPinPosition;
//     } else {
//       throw Exception('Failed to load latlng');
//     }
//   }

// Future<String> getAddressFromLatLng(
//     LatLng location, http.Client client) async {

//   String request =
//       'https://maps.googleapis.com/maps/api/geocode/json?latlng=${location.latitude},${location.longitude}&key=$kPLACES_API_KEY';

//   http.Response response = await client.get(Uri.parse(request));
//   if (response.statusCode == 200) {
//     dynamic locationData =
//         json.decode(response.body)['results'].first['formatted_address'];

//     return locationData as String;
//   } else {
//     throw Exception('Failed to load address');
//   }
// }
