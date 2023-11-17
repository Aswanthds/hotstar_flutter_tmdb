import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hotstar/Models/searchmodel.dart';
import 'package:hotstar/functions/api_end.dart';
import 'package:http/http.dart' as http;

class Services {
  var client = http.Client();
  Future<dynamic> getSouthIndian() async {
    var url = Uri.parse(ApiEndPoints.southIndian);

    var response = await client.get(url);
    debugPrint(response.statusCode.toString());
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception("eror");
    }
  }

  Future<dynamic> getTrending() async {
    var url = Uri.parse(ApiEndPoints.downloads);

    var response = await client.get(url);
    debugPrint(response.statusCode.toString());
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception("eror");
    }
  }

  Future<dynamic> getUpcomingData() async {
    var url = Uri.parse(ApiEndPoints.upcoming);

    var response = await client.get(url);
    debugPrint(response.statusCode.toString());
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception("eror");
    }
  }

  Future<dynamic> getMalayalamMovies() async {
    var url = Uri.parse(ApiEndPoints.malayalamMovies);

    var response = await client.get(url);
    debugPrint(response.statusCode.toString());
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception("eror");
    }
  }

  Future<dynamic> getTamilMovies() async {
    var url = Uri.parse(ApiEndPoints.tamilMovies);

    var response = await client.get(url);
    debugPrint(response.statusCode.toString());
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception("eror");
    }
  }

  Future<dynamic> getTenseDramas() async {
    var url = Uri.parse(ApiEndPoints.tenseDramas);

    var response = await client.get(url);
    debugPrint(response.statusCode.toString());
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception("eror");
    }
  }

  Future<dynamic> searchAPI(String query) async {
    final apiUrl = Uri.parse(ApiEndPoints.search);
    final searchUrl = apiUrl.replace(queryParameters: {
      'query': query,
      'api_key': '8151b9377204cc5f6a370dbc150c22d9'
    });

    try {
      final response = await http.get(searchUrl);

      if (response.statusCode == 200) {
        // If the request is successful, return the response body
        return response.body;
      } else {
        // If the request was not successful, return an error code
        debugPrint('Failed to fetch data: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      // Catch any exceptions that occurred during the API call
      debugPrint('Exception during API call: $e');
      return null;
    }
  }

  Future<List<SearchData>> getAllulistList(String query) async {
    final apiUrl = Uri.parse(ApiEndPoints.search);
    final searchUrl = apiUrl.replace(queryParameters: {
      'query': query,
    });
    try {
      final response = await http.get(searchUrl);
      if (response.statusCode == 200) {
        debugPrint(response.body);
        List<SearchData> list = parseAgents(response.body);
        return list;
      } else {
        throw Exception('Error');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static List<SearchData> parseAgents(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<SearchData>((json) => SearchData.fromJson(json)).toList();
  }
}
