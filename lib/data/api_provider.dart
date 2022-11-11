import 'dart:convert';
import 'package:http/http.dart';
import 'package:minggu9_api/model/popularmovies.dart';

class ApiProvider {
  String apiKey = '44baf719ae1f085a3c2e541e74ee1210';
  String baseUrl = 'https://api.themoviedb.org/3';

  Client client = Client();

  Future<PopularMovies> getPopularMovies() async {
    Response response =
        await client.get(Uri.parse('$baseUrl/movie/popular?api_key=$apiKey'));

    if (response.statusCode == 200) {
      return PopularMovies.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(response.statusCode);
    }
  }
}
