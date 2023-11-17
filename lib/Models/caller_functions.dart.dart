import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hotstar/Models/malayalam_movie_model.dart';
import 'package:hotstar/Models/searchmodel.dart';
import 'package:hotstar/Models/services.dart';
import 'package:hotstar/Models/south_indian.dart';
import 'package:hotstar/Models/tense_model.dart';
import 'package:hotstar/Models/trending.dart';
import 'package:hotstar/Models/upcoming_model.dart';

class CallHelperFunctions {
  static Future<SouthIndian?> getData() async {
    var response =
        await Services().getSouthIndian().catchError((error) => error);

    if (response == null) return null;
    debugPrint('Succesfull');
    var newPosts = southIndianFromJson(response);
    // Update the state variable with new data
    if (newPosts.results != null) {
      for (int i = 0; i < newPosts.results!.length; i++) {
        debugPrint('${newPosts.results![i].title}');
      }
    } else {
      debugPrint("Null");
    }
    return newPosts;
  }

  static Future<TrendingMovies?> getTrendingData() async {
    var response = await Services().getTrending().catchError((error) => error);

    if (response == null) return null;
    debugPrint('Succesfull');
    var newPosts = trendingMoviesFromJson(response);
    // Update the state variable with new data
    if (newPosts.results != null) {
      for (int i = 0; i < newPosts.results!.length; i++) {
        debugPrint('${newPosts.results![i].title}');
      }
    } else {
      debugPrint("Null");
    }
    return newPosts;
  }

  static Future<UpcomingModel?> getUpcomingData() async {
    var response = await Services()
        .getUpcomingData()
        .catchError((error) => error.toString());

    if (response == null) return null;

    debugPrint("Get upcoming data");
    var newPosts = upcomingModelFromJson(response);

    for (int i = 0; i < newPosts.results!.length; i++) {
      debugPrint('${newPosts.results?[i].posterPath}');
    }

    return newPosts;
  }

  static Future<MalayalamMovieModel?> getMalayalamMovies() async {
    var response = await Services()
        .getMalayalamMovies()
        .catchError((error) => error.toString());

    if (response == null) return null;

    debugPrint("Get upcoming data");
    var newPosts = malayalamMovieModelFromJson(response);

    for (int i = 0; i < newPosts.results!.length; i++) {
      debugPrint('${newPosts.results?[i].originalTitle}');
    }

    return newPosts;
  }

  static Future<MalayalamMovieModel?> getTamilMovies() async {
    var response = await Services()
        .getTamilMovies()
        .catchError((error) => error.toString());

    if (response == null) return null;

    debugPrint("Get tamil data");
    var newPosts = malayalamMovieModelFromJson(response);

    for (int i = 0; i < newPosts.results!.length; i++) {
      debugPrint('${newPosts.results?[i].title}');
    }

    return newPosts;
  }

  static Future<TenseMovieModel?> getTenseDramas() async {
    var response = await Services()
        .getTenseDramas()
        .catchError((error) => error.toString());

    if (response == null) return null;

    debugPrint("Get tensed drama data");
    var newPosts = tenseMovieModelFromJson(response);

    for (int i = 0; i < newPosts.results!.length; i++) {
      debugPrint('${newPosts.results?[i].title}');
    }

    return newPosts;
  }

  static Future<List<SearchResult>?> getSearchResults(String query) async {
    final response = await Services().searchAPI(query);
    if (response == null) return null;

   
    try {
      final Map<String, dynamic> parsed = json.decode(response);
      final searchData = SearchData.fromJson(parsed);
       debugPrint("Get search data");
      return searchData.results;
    } catch (e) {
      debugPrint('Error parsing search data: $e');
      return null;
    }
  }
}
//TopMalayalamShows